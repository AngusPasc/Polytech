#include "stdafx.h"
#include "Rectangle.hpp"
#include "circle.hpp"

void printInformation(rectangle_t frameRect)
{
	std::cout << "Left top x = " << frameRect.pos.x - frameRect.width / 2 <<
		"\nLeft top y = " << frameRect.pos.y - frameRect.height / 2 <<
		"\nRight down x = " << frameRect.pos.x + frameRect.width / 2 <<
		"\nRight down y = " << frameRect.pos.y + frameRect.height / 2 << "\n";
}

int main()
{
	std::cout << "Rectangle:" << std::endl;
	double x, y, height, wight;
	std::cout << "Input wight, height, x and y" << std::endl;
	std::cin >> wight >> height >> x >> y;
	point_t point{ x, y };
	Rectangle rectangle{ wight, height, point };
	rectangle.printInformation();
	std::cout << "Area = " << rectangle.getArea() << std::endl;
	printInformation(rectangle.getFrameRect());
	char dx[100];
	char dy[100];
	std::cout << "Input dx, dy or x, y. For examples: (+7 -3), (10 -2), (5 8), (-7 9)" << std::endl;
	std::cin >> dx >> dy;
	rectangle.move(dx, dy);
	rectangle.printInformation();
	printInformation(rectangle.getFrameRect());
	system("pause");
	std::cout << "\n\nCircle:" << std::endl;
	std::cout << "Input radius, x and y" << std::endl;
	std::cin >> height >> x >> y;
	point_t point2{ x, y };
	Circle circle{ 7, height, point2 };
	circle.printInformation();
	std::cout << "Area = " << circle.getArea() << std::endl;
	printInformation(circle.getFrameRect());
	std::cout << "Input dx, dy or x, y. For examples: (+7 -3), (10 -2), (5 8), (-7 9)" << std::endl;
	std::cin >> dx >> dy;
	circle.move(dx, dy);
	circle.printInformation();
	printInformation(circle.getFrameRect());
	system("pause");


	return 0;
}

