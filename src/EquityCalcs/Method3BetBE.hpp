#ifndef METHOD3BETBE_HPP
#define METHOD3BETBE_HPP

#include "CalculationMethod.hpp"


class Method3BetBE : public CalculationMethod
{
public:
    Method3BetBE();
    virtual ~Method3BetBE();

    virtual double calculate(std::vector<double> params);

private:
    void _updateNeededParameters(bool bAllIn);
};

#endif // METHOD3BETBE_HPP
