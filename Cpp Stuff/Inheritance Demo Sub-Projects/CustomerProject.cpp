#include "CustomerProject.hpp"

void CustomerProject::setHours(double h) {
	hours = h;
}
void CustomerProject::setMaterials(double m) {
	materials = m;
}
void CustomerProject::setTransportation(double t) {
	transportation = t;
}

CustomerProject::CustomerProject(double h, double m, double t) {
	setHours(h);
	setMaterials(m);
	setTransportation(t);
}
double CustomerProject::getHours() {
	return hours;
}
double CustomerProject::getMaterials() {
	return materials;
}
double CustomerProject::getTransportation() {
	return transportation;
}

