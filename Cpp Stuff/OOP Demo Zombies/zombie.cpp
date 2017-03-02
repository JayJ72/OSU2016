//Jay Banerji CS162 Lab4
//
#include "zombie.hpp"
#include <iostream>
using namespace std;
Zombie::Zombie () {
	count++;
}

Zombie::~Zombie () {
	count--;
}

void Zombie::speak () {
	std::cout << "Braaaaaaaaaaaains" << std::endl;
}

void Zombie::getCount() {
	cout << count;
}



