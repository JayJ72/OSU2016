// box_h.hpp : Defines the entry point for the console application.
//Jay Banerji
//Lab 3 CS162 2016

//#include "stdafx.h"
#include <iostream>

using namespace std;

class box {

private:
	double height;
	double width;
	double length;

public:
	void setHeight(double h);
	void setWidth(double w);
	void setLength(double l);
	double getVolume();
	double getSurfaceArea();
	box();
	box(double width, double length, double height);
};
