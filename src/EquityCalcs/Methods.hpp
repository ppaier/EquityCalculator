#ifndef METHODS_HPP
#define METHODS_HPP

#include "MethodOpenEV.hpp"
#include "Method3BetEV.hpp"
#include "Method4BetEV.hpp"
#include "Method5BetEV.hpp"

#include "MethodOpenBE.hpp"
#include "Method3BetBE.hpp"
#include "Method4BetBE.hpp"
#include "Method5BetBE.hpp"

enum {
    METHOD_OPEN_EV = 0,
    METHOD_OPEN_BE,
    METHOD_3BET_EV,
    METHOD_3BET_BE,
    METHOD_4BET_EV,
    METHOD_4BET_BE,
    METHOD_5BET_EV,
    METHOD_5BET_BE,

    NUM_METHODS
};


extern const char* g_methodNames[NUM_METHODS];


#endif // METHODS_HPP
