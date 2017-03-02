// Point.hpp : Defines the entry point for the console application.
//Jay Banerji
//Assignment 2 CS162 2016

//#include "stdafx.h"
#ifndef POINT_HPP
#define POINT_HPP

using namespace std;

class Point {
	private:
		double x;
		double y;
	public:
		void setx(double X);
		void sety(double Y);
		double getXCoord();
		double getYCoord();
		Point();
		Point(double x, double y);
};
#endif

