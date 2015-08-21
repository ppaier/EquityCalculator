#ifndef METHODOPENEV_HPP
#define METHODOPENEV_HPP

#include "CalculationMethod.hpp"


class MethodOpenEV : public CalculationMethod
{
public:
    MethodOpenEV();
    virtual ~MethodOpenEV();

    virtual double calculate(std::vector<double> params);
};

#endif // METHODOPENEV_HPP
