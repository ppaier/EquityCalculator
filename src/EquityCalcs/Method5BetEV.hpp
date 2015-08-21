#ifndef METHOD5BETEV_HPP
#define METHOD5BETEV_HPP

#include "CalculationMethod.hpp"


class Method5BetEV : public CalculationMethod
{
public:
    Method5BetEV();
    virtual ~Method5BetEV();

    virtual double calculate(std::vector<double> params);

private:
    void _updateNeededParameters(bool bAllIn);
};

#endif // METHOD5BETEV_HPP
