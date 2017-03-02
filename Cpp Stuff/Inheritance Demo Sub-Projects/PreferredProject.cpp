#include "PreferredProject.hpp"

double PreferredProject::billAmount() {
	double amt;
	double hrs;
	if (getHours() < 100) {
		hrs = getHours() * 80;
	}
	else {
		hrs= 80*100;
	}
	amt = (getMaterials()*0.85) + (getTransportation()*0.9) + hrs;
}

