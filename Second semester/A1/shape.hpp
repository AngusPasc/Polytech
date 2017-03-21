#ifndef SHAPE_HPP
#define SHAPE_HPP

#include "base-types.hpp"
#include <iostream>

class Shape
{
public:
	virtual double getArea() const = 0;
	rectangle_t getFrameRect() const;
	void move(char dx[], char dy[]);
	void printInformation() const;
protected:
	rectangle_t coordinate;
};

#endif