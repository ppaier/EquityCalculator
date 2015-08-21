#include "EqCalculator.hpp"
#include "Methods.hpp"

#include <exception>

EqCalculator::EqCalculator()
{
    m_vecMethods = std::vector<CalculationMethod*>(NUM_METHODS);

    m_vecMethods[METHOD_OPEN_EV] = new MethodOpenEV();
    m_vecMethods[METHOD_3BET_EV] = new Method3BetEV();
    m_vecMethods[METHOD_4BET_EV] = new Method4BetEV();
    m_vecMethods[METHOD_5BET_EV] = new Method5BetEV();

    m_vecMethods[METHOD_OPEN_BE] = new MethodOpenBE();
    m_vecMethods[METHOD_3BET_BE] = new Method3BetBE();
    m_vecMethods[METHOD_4BET_BE] = new Method4BetBE();
    m_vecMethods[METHOD_5BET_BE] = new Method5BetBE();


    m_curMethod = m_vecMethods[0];
}

EqCalculator::~EqCalculator()
{
    for(std::vector<CalculationMethod*>::iterator it = m_vecMethods.begin(); it != m_vecMethods.end(); ++it){
        delete *it;
    }
}

void EqCalculator::setCurMethod(unsigned int uintMethod)
{
    m_curMethod = m_vecMethods[uintMethod];
}

CalculationMethod *EqCalculator::getCurMethod()
{
    return m_curMethod;
}


