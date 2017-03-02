/*Jay Banerji CS162 Assignment 4 2016*/
#ifndef RECTANGLE_HPP
#define RECTANGLE_HPP
#include "Shape.hpp"
using namespace std;
//A rectangle is a shape. You already know this.
class Rectangle : public Shape {
	protected:
		double width;
		double length;
	public:
		void setWidth(double w);
		void setLength(double l);
		double getWidth();
		double getLength();
		Rectangle(double w, double l);
		double area();
		double perimeter();
};
#endif
