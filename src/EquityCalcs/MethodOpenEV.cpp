#include "MethodOpenEV.hpp"
#include "GuiObjects.hpp"
#include "Positions.hpp"

MethodOpenEV::MethodOpenEV()
{
    m_uintCalculatedValueID = EXP_VALUE;
    m_intRelHeroVill = 1;

    m_vecNeededParams = std::vector<unsigned int>(NUM_GUI_OBJECTS, 0);
    m_vecNeededParams[POS_HERO]     = 1;
    m_vecNeededParams[POS_VILL]     = 1;
    m_vecNeededParams[FOLDPCT_VILL] = 1;
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

MethodOpenEV::~MethodOpenEV()
{
}

double MethodOpenEV::calculate(std::vector<double> params)
{
    double blindWOPlayer = params[BLINDS] - params[POS_HERO] - params[POS_VILL];
    double term1  = ( blindWOPlayer + params[POS_HERO] + params[POS_VILL] ) * params[FOLDPCT_VILL]/100;
    double term2  = ( params[SIZE_OPEN] - params[POS_HERO] ) * ( 1 - params[FOLDPCT_VILL]/100 );
    double equity = term1 - term2;

    return equity;
}
