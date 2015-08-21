#include "Method5BetBE.hpp"
#include "GuiObjects.hpp"
#include "Positions.hpp"

Method5BetBE::Method5BetBE()
{
    m_uintCalculatedValueID = FOLDPCT_VILL;
    m_intRelHeroVill = -1;

    m_vecNeededParams = std::vector<unsigned int>(NUM_GUI_OBJECTS, 0);
    m_vecNeededParams[POS_HERO]     = 1;
    m_vecNeededParams[POS_VILL]     = 1;
    m_vecNeededParams[EXP_VALUE]    = 1;
    m_vecNeededParams[SIZE_OPEN]    = 1;
    m_vecNeededParams[SIZE_3BET]    = 1;
    m_vecNeededParams[SIZE_4BET]    = 1;
    m_vecNeededParams[SIZE_5BET]    = 1;
    m_vecNeededParams[ALLIN_5BET]   = 1;

    m_vecPossibleHeroPos = std::vector<unsigned int>(NUM_POSITIONS, 0);
    m_vecPossibleHeroPos[POS_MP] = 1;
    m_vecPossibleHeroPos[POS_CO] = 1;
    m_vecPossibleHeroPos[POS_BU] = 1;
    m_vecPossibleHeroPos[POS_SB] = 1;
    m_vecPossibleHeroPos[POS_BB] = 1;

    m_vecPossibleVillPos = std::vector<unsigned int>(NUM_POSITIONS, 0);
    m_vecPossibleVillPos[POS_UTG] = 1;
    m_vecPossibleVillPos[POS_MP]  = 1;
    m_vecPossibleVillPos[POS_CO]  = 1;
    m_vecPossibleVillPos[POS_BU]  = 1;
    m_vecPossibleVillPos[POS_SB]  = 1;
}

Method5BetBE::~Method5BetBE()
{
}

double Method5BetBE::calculate(std::vector<double> params)
{
    double term1, term2, villFoldPct;
    double blindWOPlayer = params[BLINDS] - params[POS_HERO] - params[POS_VILL];

    _updateNeededParameters(params[ALLIN_5BET]==1);


    if(params[ALLIN_5BET]){
        double restStack = params[SIZE_STACK] - params[SIZE_3BET];
        double A = params[EQU_HERO]/100 * params[SIZE_STACK] * 2 + blindWOPlayer - restStack;
        double B = blindWOPlayer + params[SIZE_3BET] + params[SIZE_4BET] ;
        term1 = params[EXP_VALUE] - A;
        term2 = B - A;
    }
    else{
        double A = blindWOPlayer + params[SIZE_3BET] + params[SIZE_4BET];
        double B = params[SIZE_5BET] - params[SIZE_3BET];
        term1  = params[EXP_VALUE] + B;
        term2  = B + A;
    }

    villFoldPct = 100 *(term1/term2);
    return villFoldPct;
}


void Method5BetBE::_updateNeededParameters(bool bAllIn)
{
    m_vecNeededParams[SIZE_STACK] = bAllIn;
    m_vecNeededParams[EQU_HERO]   = bAllIn;
}
