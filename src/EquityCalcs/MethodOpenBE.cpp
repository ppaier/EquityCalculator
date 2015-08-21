#include "MethodOpenBE.hpp"
#include "GuiObjects.hpp"
#include "Positions.hpp"

MethodOpenBE::MethodOpenBE()
{
    m_uintCalculatedValueID = FOLDPCT_VILL;
    m_intRelHeroVill = 1;

    m_vecNeededParams = std::vector<unsigned int>(NUM_GUI_OBJECTS, 0);
    m_vecNeededParams[POS_HERO]     = 1;
    m_vecNeededParams[POS_VILL]     = 1;
    m_vecNeededParams[EXP_VALUE]    = 1;
    m_vecNeededParams[SIZE_OPEN]    = 1;

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

MethodOpenBE::~MethodOpenBE()
{
}

double MethodOpenBE::calculate(std::vector<double> params)
{
    double blindWOPlayer = params[BLINDS] - params[POS_HERO] - params[POS_VILL];
    double term1  = params[EXP_VALUE] + params[SIZE_OPEN] - params[POS_HERO];
    double term2  = params[SIZE_OPEN] - params[POS_HERO] + blindWOPlayer + params[POS_HERO] + params[POS_VILL];
    double villFoldPct = 100 *(term1/term2);

    return villFoldPct;
}
