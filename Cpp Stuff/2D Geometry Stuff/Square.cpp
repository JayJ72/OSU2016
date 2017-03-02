/*Jay Banerji CS162 Assignment 4 2016*/
#include "Square.hpp"
#include <math.h>
using namespace std;

//Do i really need to explain what this is
void Square::setEdge(double e) {
	length = width;
	width = e;
	edge = e;
}
//Really????
double Square::getEdge() {
	return edge;
}
//This is a construct, just like happiness is
Square::Square(double e) : Rectangle(width, length) {
	setEdge(e);
}
//Overwrite virtual functions some more
double Square::area() {
	return pow(getEdge(), 2);
}
double Square::perimeter() {
	return 4*getEdge();
}
