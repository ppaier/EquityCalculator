#ifndef METHOD4BETBE_HPP
#define METHOD4BETBE_HPP

#include "CalculationMethod.hpp"


class Method4BetBE : public CalculationMethod
{
public:
    Method4BetBE();
    virtual ~Method4BetBE();

    virtual double calculate(std::vector<double> params);

private:
    void _updateNeededParameters(bool bAllIn);
};

#endif // METHOD4BETBE_HPP
