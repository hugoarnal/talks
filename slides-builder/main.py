import os
import shutil
from enum import Enum
from pathlib import Path
from typing import override

class LineType(Enum):
    Compilation = "compilation"
    Include = "include"

    @staticmethod
    def construct(line: str) -> Line:
        factory = {
            LineType.Compilation: CompilationLine,
            LineType.Include: IncludeLine
        }
        arguments = Line.getArguments(line)

        for enum in factory:
            if enum.value == arguments[0]:
                return factory[enum](arguments)

        raise Exception("Invalid type: ", arguments[0])

class Line:
    def __init__(self, lineType: LineType, arguments: list[str]) -> None:
        self.type: LineType = lineType
        self.arguments: list[str] = arguments

    def getType(self) -> LineType:
        return self.type

    def execute(self, basePath: Path, lines: list[str]) -> None: # pyright: ignore[reportUnusedParameter]
        pass

    @staticmethod
    def getArguments(line: str) -> list[str]:
        return line.split(":")

class CompilationLine(Line):
    def __init__(self, arguments: list[str]):
        super().__init__(LineType.Compilation, arguments)

    @override
    def execute(self, basePath: Path, lines: list[str]) -> None:
        _ = os.system(f"make -C {basePath}/{self.arguments[1]} {self.arguments[2]}") # pyright: ignore[reportDeprecated]

class IncludeLine(Line):
    def __init__(self, arguments: list[str]):
        super().__init__(LineType.Include, arguments)

    @override
    def execute(self, basePath: Path, lines: list[str]) -> None:
        lines.append(self.arguments[1])

class Configuration:
    def __init__(self, fileName: str) -> None:
        self.COMMENT_SIGN: str = "#"

        self.fileName: str = fileName
        self.rawLines: list[str] = []

    def read(self) -> list[Line]:
        with open(self.fileName, "r") as f:
            self.rawLines = f.read().splitlines()

        toRemove: list[str] = []
        for _, line in enumerate(self.rawLines):
            # For now, comments are only parsed if they are starting with # sign
            if line.startswith(self.COMMENT_SIGN):
                toRemove.append(line)

        for line in toRemove:
            self.rawLines.remove(line)

        # Remove empty lines
        self.rawLines = [line for line in self.rawLines if line.strip()]

        # We don't care about version for now
        for line in self.rawLines:
            if line.startswith("version:"):
                self.rawLines.remove(line)

        lines: list[Line] = []

        for line in self.rawLines:
            lines.append(LineType.construct(line))

        return lines

class Builder:
    def __init__(self):
        self.buildPath: Path = Path("build")
        self.slidesPath: Path = Path(self.buildPath / "slides")
        self.basePath: Path = Path("..")
        self.templatesPath: Path = Path("templates")
        self.config: Configuration = Configuration(str(self.basePath / "slides"))
        self.files: list[str] = []

        self._createFolder(Path(self.buildPath).parent)
        self._createFolder(Path(self.slidesPath).parent)

    def _createFolder(self, path: Path) -> None:
        if not os.path.exists(path):
            os.makedirs(path)

    def _executeConfig(self):
        for line in self.config.read():
            line.execute(self.basePath, self.files)

    def _copyToBuildFolder(self):
        for file in self.files:
            self._createFolder(Path(self.slidesPath / file).parent)
            _ = shutil.copyfile(self.basePath / file, self.slidesPath / file)

    def execute(self):
        self._executeConfig()

        self._copyToBuildFolder()

def main():
    builder = Builder()
    builder.execute()

if __name__ == "__main__":
    main()
