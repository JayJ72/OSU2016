#include "box_h.hpp"
#include <iostream>

void box::setHeight(double h) {
	height =h;
}

void box::setWidth(double w) {
	width = w;
}

void box::setLength(double l) {
	length =l;
}

double box::getVolume() {
	return length*width*height;
}

double box::getSurfaceArea() {
	return 2 * (height*width) + 2 * (width*length) + 2 * (height*length);
}

box::box(double h, double w, double l) {
	height = h;
	width = w;
	length = l;
}

box::box() {
	height = 1;
	width = 1;
	length = 1;
}
