#ifndef METHOD3BETEV_HPP
#define METHOD3BETEV_HPP

#include "CalculationMethod.hpp"


class Method3BetEV : public CalculationMethod
{
public:
    Method3BetEV();
    virtual ~Method3BetEV();

    virtual double calculate(std::vector<double> params);

private:
    void _updateNeededParameters(bool bAllIn);
};

#endif // METHOD3BETEV_HPP
