#include <iostream>
#include <vector>
#include "Circle.cpp"
/*Jay Banerji CS162 Assignment 4 2016*/
#include "Square.cpp"

using namespace std;

//vector me up fam
double avgarea(vector <Shape*> avg) {
	double total=0; //because last time when i didn't do this i panicked for 3 hours and tried to rewrite g++ source code
	double result;
	for (int i=0; i<avg.size(); i++) { //pass through the vector and add up the area of each shape
		total = total+ avg.at(i)->area();
	}
	result = total / avg.size(); //we all know how to calculate averages, so whatever
	return result;
}

/* I commented this out for you, but if it breaks with your main I will buy you lunch to test using this one instead. *LEGALLY NOT A BRIBE*/
int main() {
	Square s(6.0);
	Rectangle r(5.5, 3.5);
	Circle c(4.4);
	
	Shape* S1 = &s;
	Shape* S2 = &r;
	Shape* S3 = &c;
	
	cout <<"Square's Area = " << S1 -> area() <<endl<< "Square's Perimeter = " << S1 -> perimeter() <<endl;
	cout <<"Rectangle's Area = " << S2 -> area() <<endl<< "Rectangle's Perimeter = "<< S2 -> perimeter() <<endl;
	cout <<"Circle's Area = " << S3 -> area() <<endl<< "Circle's Perimeter = " << S3 -> perimeter() << endl;

	vector <Shape*> avg;
	avg.push_back(&s);
	avg.push_back(&r);
	avg.push_back(&c);
	cout << endl << "Total average is: " << avgarea(avg) << endl;

	return 0;
}

