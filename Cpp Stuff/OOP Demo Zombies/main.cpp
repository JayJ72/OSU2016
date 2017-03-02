//Jay Banerji CS162 Lab4
//
#include "zombie.hpp"
#include <vector>
#include <iostream>

using namespace std;

int Zombie::count = 0;
int main () {
	vector <Zombie*> Zombies;
	cout << "Press 1 to create new zombie"<< endl;
	cout << "Press 2 to destroy a zombie"<< endl;
	cout << "Press 3 to print number of existing zombies"<< endl;
	cout << "Press 4 to get them to speak"<<endl;
	cout << "Press 5 to quit" <<endl;
	bool menu = true;
	while (menu == true) {
		int options;
		cin >> options;
		Zombie* temp;
		if(options ==1) {
			temp = new Zombie;
			Zombies.push_back(temp);
			menu=true;
		}
		else if (options == 2) {
			Zombies.pop_back();
			delete Zombies[Zombies.size()];
		}
		else if (options == 3) {
			cout << "There are " << Zombies[0]->count << " zombies left" << endl;
		}
		else if (options == 4) {
			for (int i=0; i<Zombie::count; i++) {
				(Zombies.at(i))-> speak();
			}
		}
		else if (options == 5) {
			menu = false;
			for (int i=0; i<Zombies.size(); i++) {
				delete Zombies.at(i);
			}
		}
	}
	cout << "You died" << endl;
}
