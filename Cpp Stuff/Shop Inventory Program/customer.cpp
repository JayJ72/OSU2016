#include "Customer.hpp"

using namespace std; 
//Constructor
Customer::Customer(string n, string a, bool pm) {
	name = n;
	accountID = a;
	premiumMember = pm;
}

//Gets and other functions
string Customer::getAccountID() {
	return accountID;
}
//Using vector operations
void Customer::addProductToCart(string p) {
	cart.push_back(p);
}

bool Customer::isPremiumMember() {
	return premiumMember;	
}
void Customer::emptyCart() {
	cart.clear();
}
//Took me a while to figure this one out ya tricky drongos
vector<string> Customer::getCart() {
	return cart;
} 

