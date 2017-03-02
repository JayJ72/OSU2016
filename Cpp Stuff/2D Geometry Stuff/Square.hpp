/*Jay Banerji CS162 Assignment 4 2016*/
#ifndef SQUARE_HPP
#define SQUARE_HPP
#include "Rectangle.hpp"
#include "Rectangle.cpp"
using namespace std;
//Square's got grandparents, unlike me
class Square : public Rectangle {
	protected:
		double edge; //LOOK HOW EDGY I AM JFC
	public:
		void setEdge(double e);
		Square(double e);
		double getEdge();
		double area(); //I tried having it used rectangle's but g++ was being annoying
		double perimeter();
};
#endif
