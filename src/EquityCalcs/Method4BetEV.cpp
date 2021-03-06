#include "Method4BetEV.hpp"
#include "GuiObjects.hpp"
#include "Positions.hpp"

Method4BetEV::Method4BetEV()
{

    m_uintCalculatedValueID = EXP_VALUE;
    m_intRelHeroVill = 1;

    m_vecNeededParams = std::vector<unsigned int>(NUM_GUI_OBJECTS, 0);
    m_vecNeededParams[POS_HERO]     = 1;
    m_vecNeededParams[POS_VILL]     = 1;
    m_vecNeededParams[FOLDPCT_VILL] = 1;
    m_vecNeededParams[SIZE_OPEN]    = 1;
    m_vecNeededParams[SIZE_3BET]    = 1;
    m_vecNeededParams[SIZE_4BET]    = 1;
    m_vecNeededParams[ALLIN_4BET]   = 1;

    m_vecPossibleHeroPos = std::vector<unsigned int>(NUM_POSITIONS, 0);
    m_vecPossibleHeroPos[POS_UTG] = 1;
    m_vecPossibleHeroPos[POS_MP]  = 1;
    m_vecPossibleHeroPos[POS_CO]  = 1;
    m_vecPossibleHeroPos[POS_BU]  = 1;
    m_vecPossibleHeroPos[POS_SB]  = 1;

    m_vecPossibleVillPos = std::vector<unsigned int>(NUM_POSITIONS, 0);
    m_vecPossibleVillPos[POS_MP] = 1;
    m_vecPossibleVillPos[POS_CO] = 1;
    m_vecPossibleVillPos[POS_BU] = 1;
    m_vecPossibleVillPos[POS_SB] = 1;
    m_vecPossibleVillPos[POS_BB] = 1;
}


Method4BetEV::~Method4BetEV()
{
}

double Method4BetEV::calculate(std::vector<double> params)
{
    double term1, term2, equity;
    double blindWOPlayer = params[BLINDS] - params[POS_HERO] - params[POS_VILL];

    _updateNeededParameters(params[ALLIN_4BET]==1);

    if(params[ALLIN_4BET]){
        double restStack = params[SIZE_STACK] - params[SIZE_OPEN];
        term1 = params[EQU_HERO]/100 * params[SIZE_STACK] * 2 + blindWOPlayer - restStack;
        term2 = blindWOPlayer + params[SIZE_OPEN] + params[SIZE_3BET];
    }
    else{
        term1  = - (params[SIZE_4BET] - params[SIZE_OPEN]);
        term2  = blindWOPlayer + params[SIZE_3BET] + params[SIZE_OPEN];
    }

    equity = ( ( 1 - params[FOLDPCT_VILL]/100) * term1 ) + ( params[FOLDPCT_VILL]/100 * term2 );
    return equity;
}

void Method4BetEV::_updateNeededParameters(bool bAllIn)
{
    m_vecNeededParams[SIZE_STACK] = bAllIn;
    m_vecNeededParams[EQU_HERO]   = bAllIn;
}
