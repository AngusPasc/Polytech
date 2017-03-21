#include "stdafx.h"
#include "rectangle.hpp"



Rectangle::Rectangle()
{
	coordinate.height = 0;
	coordinate.width = 0;
	coordinate.pos.x = 0;
	coordinate.pos.y = 0;
}
Rectangle::Rectangle(double width, double height, point_t pos)
{
	if (pos.y < 0 || pos.x < 0 || width < 0 || height < 0)
	{
		std::cerr << "Wrong coordinate! \n";
		coordinate.height = 0;
		coordinate.width = 0;
		coordinate.pos.x = 0;
		coordinate.pos.y = 0;
		return;
	}
	coordinate.height = height;
	coordinate.width = width;
	coordinate.pos.x = pos.x;
	coordinate.pos.y = pos.y;
}
double Rectangle::getArea() const
{
	return (coordinate.height * coordinate.width);
}
