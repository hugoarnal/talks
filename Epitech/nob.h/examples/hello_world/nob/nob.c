#define NOB_IMPLEMENTATION
#include "nob.h"

int main(void)
{
    Nob_Cmd cmd = {0};

    nob_cmd_append(&cmd, "gcc", "-o", "hello", "main.c");
    if (!nob_cmd_run_sync(cmd))
        return 84;
    return 0;
}
