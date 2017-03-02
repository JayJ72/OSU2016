#include<iostream>
#include "Store.hpp"

int main()
{
	// Open up the store
	Store shop;

	// Create some products
	Product p1("123","red blender","sturdy blender perfect for making smoothies and sauces",350,8),
	p2("234", "hot air balloon", "fly into the sky in your own balloon - comes in red, blue, or chartreuse", 700, 2),
	p3("345", "live goat", "it is a goat", 400, 0),
	p4("456", "giant robot", "crush your enemies", 7000, 1),
	p5("567", "oak and glass coffee table", "made in china", 250, 3);
	shop.addProduct(&p1); shop.addProduct(&p2); shop.addProduct(&p3); shop.addProduct(&p4); shop.addProduct(&p5);

	// Create some members
	Customer m1("Alice", "abc", true),
	m2("Bob", "bcd", false),
	m3("Carl", "cde", false);
	shop.addMember(&m1); shop.addMember(&m2); shop.addMember(&m3);

	// Search for products
	shop.productSearch("rEd");
	shop.productSearch("chameleon");
	shop.productSearch("table");

	// Add products to members' carts
	shop.addProductToMemberCart("234","abc");
	shop.addProductToMemberCart("234","cde");
	shop.addProductToMemberCart("567","aab");
	shop.addProductToMemberCart("100","bcd");
	shop.addProductToMemberCart("123","bcd");
	shop.addProductToMemberCart("567","abc");
	shop.addProductToMemberCart("234","cde");
	shop.addProductToMemberCart("345","cde");	
	// Check out members
	shop.checkOutMember("abc");
	shop.checkOutMember("bcd");
	shop.checkOutMember("cde");

	return 0;
}
