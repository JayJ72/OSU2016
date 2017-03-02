//Jay Banerji
//Assignment 2 CS162 2016

#include "Line.hpp"
#include "Point.hpp"
#include <cmath>
using namespace std;

Line::Line (Point point1, Point point2) {
	this->point1 = point1;
	this->point2 = point2;
}
Point Line::getPoint1() {
	return point1;
}
Point Line::getPoint2() {
	return point2;
}

double Line::slope() {
	return (point2.getYCoord()-point1.getYCoord() / point2.getXCoord()-point1.getXCoord());
}
double Line::distanceTo(Point P2) {
	return sqrt((pow(point1.getXCoord()-point2.getXCoord(),2)) + (pow(point1.getYCoord()-point2.getYCoord(),2)));
}
Point Line::intersectWith(Point intersectP) {
	return point1;//intersection formula
}
