#include "Product.hpp"

using namespace std;

//Constructor
Product::Product(string id, string t, string d, double p, int qa) {
	idCode = id;
	title = t;
	description = d;
	price = p;
	quantityAvailable = qa;
}
//Get methods
string Product::getIdCode() {
	return idCode;
}
string Product::getTitle() {
	return title;
}
string Product::getDescription() {
	return description;
}
double Product::getPrice() {
	return price;
}
int Product::getQuantityAvailable() {
	return quantityAvailable;
}
//Decrement quantity
void Product::decreaseQuantity() {
	quantityAvailable--;
	return;
}



