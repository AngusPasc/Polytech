#include "stdafx.h"
#include "shape.hpp"

void Shape::printInformation() const
{
	std::cout << "centre.x = " << coordinate.pos.x << "\ncentre.y = " << coordinate.pos.y <<
		"\nheight = " << coordinate.height << "\nwigth = " << coordinate.width << "\n";
}
void Shape::move(char dx[], char dy[])
{
	if (dx[0] == '+' || dx[0] == '-')
	{
		coordinate.pos.x += atof(dx);
	}
	else
	{
		coordinate.pos.x = atof(dx);
	}
	if (dy[0] == '+' || dy[0] == '-')
	{
		coordinate.pos.y += atof(dy);
	}
	else
	{
		coordinate.pos.y = atof(dy);
	}
}
rectangle_t Shape::getFrameRect() const
{
	rectangle_t rectangle;
	rectangle.height = coordinate.height;
	rectangle.width = coordinate.width;
	rectangle.pos.x = coordinate.pos.x;
	rectangle.pos.y = coordinate.pos.y;
	return rectangle;
}