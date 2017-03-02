#include "CustomerProject.hpp"
#include "RegularProject.hpp"
#include "PreferredProject.hpp"
#include <iostream>

using namespace std;

int main() {
	RegularProject a(10, 10, 10);
	RegularProject b(10, 10, 10);
		double cost;
		cost = a.billAmount();
		cout << "HEY! This regular project is gonna cost us $" << cost << "!" << endl;
		cost = b.billAmount();
		cout <<"HEY! This preferred project is gonna cost us $" << cost << "!" << endl;
}
