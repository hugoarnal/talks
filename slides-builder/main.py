import os
import shutil
from enum import Enum
from jinja2 import Environment, FileSystemLoader, select_autoescape
from pathlib import Path

class LineType(Enum):
    Compilation = "compilation"
    Include = "include"

    @staticmethod
    def construct(line: str) -> Line | None:
        factory = {
            LineType.Compilation: CompilationLine,
            LineType.Include: IncludeLine
        }
        arguments = Line.getArguments(line)

        for enum in factory:
            if enum.value == arguments[0]:
                return factory[enum](arguments)

class Line:
    def __init__(self, arguments):
        self.type = None
        self.arguments = arguments

    def getType(self) -> LineType:
        return self.type

    def execute(self, basePath: Path, lines: list[str]) -> None:
        pass

    @staticmethod
    def getArguments(line: str) -> list[str]:
        return line.split(":")

class CompilationLine(Line):
    def __init__(self, arguments):
        super().__init__(arguments)
        self.type = LineType.Compilation

    def execute(self, basePath: Path, lines: list[str]) -> None:
        os.system(f"make -C {basePath}/{self.arguments[1]} {self.arguments[2]}")

class IncludeLine(Line):
    def __init__(self, arguments):
        super().__init__(arguments)
        self.type = LineType.Include

    def execute(self, basePath: Path, lines: list[str]) -> None:
        lines.append(self.arguments[1])

class Configuration:
    def __init__(self, fileName: str) -> None:
        self.COMMENT_SIGN = "#"

        self.fileName = fileName
        self.rawLines = []

    def read(self) -> list[Line]:
        with open(self.fileName, "r") as f:
            self.rawLines = f.read().splitlines()

        toRemove = []
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
        if not os.path.exists("build"):
            os.mkdir("build")

        self.buildPath = Path("build")
        self.basePath = Path("..")
        self.templatesPath = Path("templates")
        self.config = Configuration(self.basePath / "slides")
        self.files = []

    def _executeConfig(self):
        for line in self.config.read():
            line.execute(self.basePath, self.files)

    def _copyToBuildFolder(self):
        for file in self.files:
            path = Path(self.buildPath / file).parent
            if not os.path.exists(path):
                os.makedirs(path)
            shutil.copyfile(self.basePath / file, self.buildPath / file)

    def _generateIndex(self):
        index = Path(self.buildPath / "index.html")
        env = Environment(loader=FileSystemLoader(self.templatesPath), autoescape=select_autoescape())

        template = env.get_template("index.html")
        buf = template.render(slides=self.files)

        with open(index, "wb") as f:
            f.write(bytes(buf, "utf-8"))

    def execute(self):
        self._executeConfig()

        self._copyToBuildFolder()
        self._generateIndex()

def main():
    builder = Builder()
    builder.execute()

if __name__ == "__main__":
    main()
