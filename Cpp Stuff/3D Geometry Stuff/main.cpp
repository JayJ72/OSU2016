#include <iostream>
#include "box_h.hpp"

using namespace std;

int main(int argc, const char * argv[]) {
	box box1(2.4, 7.1, 5.0);
	box box2;
	double volume1 = box1.getVolume();
	double surfaceArea1 = box1.getSurfaceArea();
	double volume2 = box2.getVolume();
	double surfaceArea2 = box2.getSurfaceArea();

		cout << volume1 << endl;
		cout << surfaceArea1;
}
