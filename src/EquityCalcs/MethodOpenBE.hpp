#ifndef METHODOPENBE_HPP
#define METHODOPENBE_HPP

#include "CalculationMethod.hpp"


class MethodOpenBE : public CalculationMethod
{
public:
    MethodOpenBE();
    virtual ~MethodOpenBE();

    virtual double calculate(std::vector<double> params);
};

#endif // METHODOPENBE_HPP
