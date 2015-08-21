#include "CalculationMethod.hpp"

std::vector<unsigned int> CalculationMethod::getNeededParams()
{
    return(m_vecNeededParams);
}

unsigned int CalculationMethod::getCalculatedValueID()
{
    return m_uintCalculatedValueID;
}

int CalculationMethod::getRelationHeroVillain()
{
    return m_intRelHeroVill;
}


std::vector<unsigned int> CalculationMethod::getPossibleHeroPos()
{
    return m_vecPossibleHeroPos;
}

std::vector<unsigned int> CalculationMethod::getPossibleVillPos()
{
    return m_vecPossibleVillPos;
}
