#include "Store.hpp"
#include <iostream>

using namespace std;
//V-V-Vector operations!

void Store::addProduct(Product* p) {
	inventory.push_back (p);
}
void Store::addMember(Customer* c) {
	members.push_back (c);
}
Product* Store::getProductFromID(string getid) {
	int x; //C++ doesn't like reusing the i variable so i had to do this to appease the picky bitch
	bool pExists = false;
	//Loop through the inventory to see if we actually have what they want to buy
	for (int i=0; i<inventory.size(); i++) {
		if (inventory.at(i) -> getIdCode() == getid) {
			x = i;
			bool pExists = true;
		}
	}
	if (pExists = true) {
		return inventory.at(x);
	}
	//Notify them that they're looking in the wrong place
	else {
		return NULL;
		cout << "That product does not exist" << endl;
	}
}
Customer* Store::getMemberFromID(string getAcc) {
	int x; //Because c++ doin me the annoy
	bool mExists = false;
	//Find the member by looping through the member vector
	for (int i=0; i<members.size(); i++) {
		if (members.at(i) -> getAccountID() == getAcc) {
			x = i;
			bool mExists = true;
		}
	}	
	if (mExists = true) {
		return members.at(x);
	}
	else {
	//Notify ghostbusters
		return NULL;
		cout << "That Member does not exist" << endl;
	}
}
void Store::productSearch(string str) {
	int x; //Because c++ no likey me using the i variable again
	bool exists = true;
	//Loop through the inventory and use find to see if any string similarities exist either in title or description
	for (int i=0; i<inventory.size(); i++) {
		if (string::npos== inventory.at(i) -> getTitle().find(str) || inventory.at(i) -> getDescription().find(str)) {
			exists = false;
		}
		else 
		x = i;
		//Print the information from the search
		cout << inventory.at(i) -> getIdCode()<< endl;
		cout << inventory.at(i) -> getTitle()<< endl;
		cout << inventory.at(i) -> getDescription()<<endl;
		cout << inventory.at(i) -> getPrice()<<endl;
		cout << inventory.at(i) -> getQuantityAvailable()<<endl;
	}
}
void Store::addProductToMemberCart(string pID, string mID) {
	Product* tempP;
	Customer* tempC;
	bool pExists = false;
	bool mExists = false;
	//Check that your product exists or if they're asking for eggs at a lemonade stand or something equally stupid
	for (int i=0; i<inventory.size(); i++) {
		if (pID == inventory.at(i) -> getIdCode()) {
			tempP = getProductFromID(pID);
			pExists = true;
		}
	}
	if (pExists != false) {
			cout << "Product" << pID << "not found" << endl;
	}
	//Check that the customer actually exists or if they're an invisible specter that for some reason wants to buy stuff
	for (int i=0; i<members.size(); i++) {
		if (mID == members.at(i) -> getAccountID()) {
			tempC = getMemberFromID(mID);
			mExists = true;
		}
		else {
			cout << "Member " << mID << " not found" << endl;
		}
	}
	//Actually put it in their cart
	if (pExists == true && mExists == true) {
		tempC -> getAccountID();
		tempC -> addProductToCart(tempP -> getIdCode());
	}
}
void Store::checkOutMember(string mID) {
	Product* tempP; //Object for Product
	Customer* tempC; //Object for Customer
	bool mExists = false; //Check if the member exists or not
	double subtotal = 0; //Initialize the variables and stuff
	double total = 0;
	double shipping = 0;
	//Loop through members vector to check if the members exist
	for (int i=0; i<members.size(); i++) {
		if (mID == members.at(i) -> getAccountID()) {
			tempC = getMemberFromID(mID);
			mExists = true;
		} 
		else {
			cout << "Member " << mID << " not found" << endl;
		}
	}
	if (mExists = true) {
		//See if the cart is empty or not
		int z = 0;
		z = tempC -> getCart().size();
		cout << z;
		if (tempC -> getCart().size() == 0) {
			cout << "Cart is empty" << endl;
		}
		//Loop through the cart items
		for (int i=0; i<tempC -> getCart().size(); i++) {
			string tempID = tempC -> getCart().at(i);
			//Check the quantities
			if (getProductFromID(tempID) -> getQuantityAvailable() == 0) {
				cout << "Sorry, none left" << endl;
			}
			else {
			//Get the info of cart items and the subtotal
			cout << "Product: " << getProductFromID(tempID) -> getTitle() << endl;
			cout << "Price: " <<  getProductFromID(tempID) -> getPrice() << endl;
			getProductFromID(tempID) -> decreaseQuantity(); //decrease the quantity
			subtotal = subtotal + getProductFromID(tempID) -> getPrice(); 
			}
		}
		//Give premium members free shipping
		cout << "Subtotal: " << subtotal << endl;
		if (tempC -> isPremiumMember() == true) {
			shipping = 0;
		}
		//Make everyone else pay exorbitant shipping rates and absorb the profits for a new jacuuzi
		else {
			shipping = subtotal * 0.07;
		}
		//Calculate the totals with shipping
		cout << "Shipping: " << shipping << endl;
		total = shipping + subtotal;
		cout << "Total: " << total << endl;
		tempC -> emptyCart(); //Clear the cart to continue the cycle of consumerism
	}
}
