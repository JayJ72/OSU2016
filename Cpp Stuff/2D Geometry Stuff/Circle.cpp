/*Jay Banerji CS162 Assignment 4 2016*/
#define _USE_MATH_DEFINES //What stackoverflow told me to do
#include "Circle.hpp"
#include <math.h>
using namespace std;
void Circle::setRadius(double r) {
	radius = r;
}
//get rekt
double Circle::getRadius() {
	return radius;
}
//bob the builder
Circle::Circle(double r) {
	setRadius(r);
}
//More of stackoverflow, overwriting the virtual functions
double Circle::area() {
	return M_PI*pow(getRadius(), 2);
}
double Circle::perimeter() {
	return 2 * M_PI * getRadius();
}
