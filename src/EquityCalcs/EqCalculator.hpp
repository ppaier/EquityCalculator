#ifndef EQCALCULATOR_HPP
#define EQCALCULATOR_HPP

#include <iostream>
#include <vector>
#include <map>

#include "CalculationMethod.hpp"

class EqCalculator
{
public:
    CalculationMethod *m_curMethod;

private:
    std::vector<CalculationMethod*> m_vecMethods;

public:
    EqCalculator();
    virtual ~EqCalculator();

    void setCurMethod(unsigned int uintMethod);
    CalculationMethod* getCurMethod();

};

#endif // EQCALCULATOR_HPP
