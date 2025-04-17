#define NOB_IMPLEMENTATION
#define NOB_STRIP_PREFIX
#include "nob.h"

#define RAYLIB_ARCHIVE "raylib.tar.gz"
#define RAYLIB_FOLDER "raylib"
#define RAYLIB_LINK "https://github.com/raysan5/raylib/releases/download/5.5/raylib-5.5_linux_amd64.tar.gz"

bool download_raylib(Cmd *cmd)
{
    int is_raylib_installed = file_exists("raylib");

    if (is_raylib_installed == 1)
        return true;
    else if (is_raylib_installed == -1)
        return false;

    cmd_append(cmd, "curl", "-Lo", RAYLIB_ARCHIVE, RAYLIB_LINK);
    if (!cmd_run_sync_and_reset(cmd))
        return false;

    mkdir_if_not_exists(RAYLIB_FOLDER);
    cmd_append(cmd, "tar", "-xvf", RAYLIB_ARCHIVE, "-C", RAYLIB_FOLDER, "--strip-components=1");
    if (!cmd_run_sync_and_reset(cmd))
        return false;
}

int main(void)
{
    Cmd cmd = {0};

    if (!download_raylib(&cmd))
        return 84;
    // TODO: continue this
    return 0;
}
