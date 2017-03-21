#include "shape.hpp"

class Circle : public Shape
{
public:
	Circle();
	Circle(double, double, point_t);
	double getArea() const;
	void printInformation() const;
};