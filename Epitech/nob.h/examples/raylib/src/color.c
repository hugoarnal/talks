#include "hello.h"

Color get_random_color(void)
{
    Color colors[MAX_COLORS_COUNT] = {
        MAROON, ORANGE, DARKGREEN, DARKBLUE, DARKPURPLE,
        GRAY, RED, GOLD, LIME, BLUE, VIOLET, LIGHTGRAY, PINK, YELLOW,
        GREEN, SKYBLUE, PURPLE, BEIGE };

    return colors[rand() % MAX_COLORS_COUNT];
}
