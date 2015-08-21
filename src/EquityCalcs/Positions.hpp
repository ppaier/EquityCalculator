#ifndef POSITIONS_HPP
#define POSITIONS_HPP

enum {
    POS_UTG = 0,
    POS_MP,
    POS_CO,
    POS_BU,
    POS_SB,
    POS_BB,

    NUM_POSITIONS
};


extern const char*  g_positionNames[NUM_POSITIONS];
extern const double g_positionBlinds[NUM_POSITIONS];

#endif // POSITIONS_HPP
