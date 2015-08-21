#ifndef METHOD5BETBE_HPP
#define METHOD5BETBE_HPP

#include "CalculationMethod.hpp"


class Method5BetBE : public CalculationMethod
{
public:
    Method5BetBE();
    virtual ~Method5BetBE();

    virtual double calculate(std::vector<double> params);

private:
    void _updateNeededParameters(bool bAllIn);
};

#endif // METHOD5BETBE_HPP
