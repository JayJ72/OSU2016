#include "RegularProject.hpp"


double RegularProject::billAmount() {
	double amt;
	amt = getMaterials() + getTransportation() + (getHours()*80);
}
 
	
