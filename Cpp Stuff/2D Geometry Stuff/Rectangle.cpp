/*Jay Banerji CS162 Assignment 4 2016*/
#include "Rectangle.hpp"

using namespace std;
//set myself up for failure
void Rectangle::setWidth(double w) {
	width = w;
}
void Rectangle::setLength(double l) {
	length = l;
}
//get acquainted with mediocrity
double Rectangle::getWidth() {
	return width;
}
double Rectangle::getLength() {
	return length;
}
//do something constructive for once in my life
Rectangle::Rectangle(double w, double l) {
	setLength(l);
	setWidth(w);
}
//overwrite virtual functions.. again
double Rectangle::area() {
	return getWidth()*getLength();
}
double Rectangle::perimeter() {
	return 2*(getWidth()+getLength());
}
