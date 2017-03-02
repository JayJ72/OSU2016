#include <vector>
#include <iostream>
#include <algorithm>
#include <cstdlib>

using namespace std;

	template <class  T>
void print (vector<T> thing) {
	typename vector<T>::iterator ahhh;
	ahhh = thing.begin();
	while (ahhh != thing.end() ) {
		cout << *ahhh << "  ";
		ahhh ++;
	}
	cout <<endl;
}

template <class T>
void shuffle (vector<T> &thing) {
	srand (time(NULL));
	random_shuffle(thing.begin(), thing.end());
}


int main () {
	vector <double> shit;
	for (int i=0; i<50; i++) {
		shit.push_back(i*1.5);
	}
	print(shit);
	shuffle(shit);
	print(shit);
	return 0;
}
