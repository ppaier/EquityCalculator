#ifndef METHOD4BETEV_HPP
#define METHOD4BETEV_HPP

#include "CalculationMethod.hpp"


class Method4BetEV : public CalculationMethod
{
public:
    Method4BetEV();
    virtual ~Method4BetEV();

    virtual double calculate(std::vector<double> params);

private:
    void _updateNeededParameters(bool bAllIn);
};

#endif // METHOD4BETEV_HPP
