//Jay Banerji
//Assignment 2 CS162 2016
#ifndef LINE_HPP
#define LINE_HPP
#include "Point.hpp"
//#include "stdafx.h"

using namespace std;
class Point;
class Line {
	private:
		Point point1;
		Point point2;
	public:
		Line();
		Line(Point point1, Point point2);
		double slope();
		double distanceTo(Point p2);
		Point intersectWith(Point intersectP);
		Point getPoint1();
		Point getPoint2();
};
#endif
