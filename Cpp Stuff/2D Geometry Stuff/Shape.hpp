/*Jay Banerji CS162 Assignment 4 2016*/
#ifndef SHAPE_HPP
#define SHAPE_HPP

using namespace std;

//This is all empty, just like existence. It'll be fulfilled in by other inherited classes, unlike existence.
class Shape {
	protected:
	public:
		//100% uncut pure virtual functions from medellin
		virtual double area() = 0;
		virtual double perimeter() = 0;
};
#endif
