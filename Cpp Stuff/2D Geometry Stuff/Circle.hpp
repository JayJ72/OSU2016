/*Jay Banerji CS162 Assignment 4 2016*/

#ifndef CIRCLE_HPP
#define CIRCLE_HPP
#include "Shape.hpp"
//A circle is also a shape. We learnt this in preschool.
class Circle : public Shape {
	protected:
		double radius;
	public:
		void setRadius(double r);
		double getRadius();
		Circle(double r);
		double area();
		double perimeter();
};
#endif
