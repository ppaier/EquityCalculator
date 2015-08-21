#ifndef GUIOBJECTS_HPP
#define GUIOBJECTS_HPP

enum {
    POS_HERO = 0,
    POS_VILL,
    BLINDS,
    SIZE_OPEN,
    SIZE_3BET,
    ALLIN_3BET,
    SIZE_4BET,
    ALLIN_4BET,
    SIZE_5BET,
    ALLIN_5BET,
    SIZE_STACK,
    FOLDPCT_VILL,
    EQU_HERO,
    EXP_VALUE,

    NUM_GUI_OBJECTS
};

extern const double g_tolGuiObjects[NUM_GUI_OBJECTS][2];

#endif // GUIOBJECTS_HPP
