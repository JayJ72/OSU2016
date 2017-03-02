#include "MyInteger.hpp"

MyInteger::MyInteger(int Num) {
	pInteger = new int;
	setMyInt(Num);
}
MyInteger::~MyInteger() {
	delete pInteger;
}
MyInteger::MyInteger(MyInteger &obj) {
	pInteger = new int;
	*pInteger = obj.getMyInt();
}
void MyInteger::setMyInt(int Num) {
	*this -> pInteger = Num;
	//Using dereference to get value of int pointer and set it to the value passed in
}
int MyInteger::getMyInt() {
	return *pInteger;
}

MyInteger& MyInteger::operator=( MyInteger Num) {
	*pInteger=Num.getMyInt();
	return *this;
}
