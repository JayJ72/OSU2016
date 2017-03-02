//Jay Banerji 
//CS162 Assignment 2 2016
#include "Point.hpp"
#include "Line.hpp"
//#include "stdafx.h"
#include <iostream>
#include <cmath>

using namespace std;
//as per the Assignment requirements
int main(int argc, const char * argv[]) {
	Point p1(-1.5, 0.0);
	Point p2(1.5, 4.0);
	double dist = point1.distanceTo(point2);
	Line line1(p1, p2);
	Line line2(Point p3, Point p4);
	double slope = line1.slope();
	Point intersection = line1.intersectWith(line2);
}
