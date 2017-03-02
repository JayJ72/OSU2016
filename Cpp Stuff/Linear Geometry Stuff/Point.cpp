//Jay Banerji
//Assignment 2 CS162 2016
#include "Point.hpp"

using namespace std;

void Point::setx(double X) {
	x = X;
}
void Point::sety(double Y) {
	y = Y;
}
double Point::getXCoord() {
	return  x;
}
double Point::getYCoord() {
	return  y;
}
Point::Point(double X, double Y) {
	x = X;
	y = Y;
}
Point::Point() {
	x = 1;
	y = 1;
}
