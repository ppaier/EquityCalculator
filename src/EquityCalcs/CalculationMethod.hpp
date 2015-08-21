#ifndef CALCULATIONMETHOD_HPP
#define CALCULATIONMETHOD_HPP


#include <vector>

class CalculationMethod
{

protected:
    std::vector<unsigned int> m_vecNeededParams;
    std::vector<unsigned int> m_vecPossibleHeroPos;
    std::vector<unsigned int> m_vecPossibleVillPos;
    int m_intRelHeroVill;
    unsigned int m_uintCalculatedValueID;

public:
    CalculationMethod() {}
    virtual ~CalculationMethod() {}

    virtual double calculate(std::vector<double> params) = 0;

    std::vector<unsigned int> getNeededParams();
    unsigned int getCalculatedValueID();
    int getRelationHeroVillain();
    std::vector<unsigned int> getPossibleHeroPos();
    std::vector<unsigned int> getPossibleVillPos();
};

#endif // CALCULATIONMETHOD_HPP
