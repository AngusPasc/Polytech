#include "shape.hpp"


class Rectangle : public Shape
{
public:
	Rectangle();
	Rectangle(double, double, point_t);
	double getArea() const;
};