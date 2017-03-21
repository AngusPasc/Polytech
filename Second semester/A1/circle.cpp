#include "stdafx.h"
#include "circle.hpp"
#define PI 3.14159265358



Circle::Circle()
{
	coordinate.height = 0;
	coordinate.width = 0;
	coordinate.pos.x = 0;
	coordinate.pos.y = 0;
}
Circle::Circle(double width, double radius, point_t pos)
{
	if (pos.y < 0 || pos.x < 0 || width < 0 || radius < 0)
	{
		std::cerr << "Wrong coordinate! \n";
		coordinate.height = 0;
		coordinate.width = 0;
		coordinate.pos.x = 0;
		coordinate.pos.y = 0;
		return;
	}
	coordinate.height = radius;
	coordinate.width = radius;
	coordinate.pos.x = pos.x;
	coordinate.pos.y = pos.y;
}
double Circle::getArea() const
{
	return (pow(coordinate.height, 2)*PI/4);
}
void Circle::printInformation() const
{
	std::cout << "centre.x = " << coordinate.pos.x << "\ncentre.y = " << coordinate.pos.y <<
		"\nradius = " << coordinate.height << "\n";
}