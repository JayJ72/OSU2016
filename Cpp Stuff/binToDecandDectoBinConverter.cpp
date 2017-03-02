// converter.cpp : Defines the entry point for the console application.
//Jay Banerji
//CS162 Fall 2016
//Create a program that converts decimal to binary, and binary to decimal

#include <iostream>
#include <string>
#include <cmath>
#include <exception>


using namespace::std;




int binToDec(string binary, int i=0) {
	int decsum = 0; //where the decimal will be stored
	if (i < binary.length()) { //base case
		if (binary[i] == '1')
			decsum = pow(2, binary.length()-i-1); //subtracting from length to go right to left
		else if (binary[i] == '0')
			decsum = 0;
		else if (binary[i] == !('0' || '1')) //for making program robust
			cout << "Please only enter binary digits (0,1)";
		return decsum + binToDec(binary, ++i); //recursion
	}
	return decsum;
}

int	decToBin(int decimal2) {
	int remainder;
	remainder = decimal2 % 2;
	if (decimal2 > 0) { //base case
		decToBin(decimal2 / 2);//recursion
		cout << remainder;//print after recursion to make it print in correct orientation
		return 0;
	}
}

int main() {
	int answer;
	string binary;
	int	decimal2;
	cout << endl << "Do you want to convert Binary to Decimal or Decimal to Binary? (1,0)" << endl;
	cin >> answer;
	if (answer == 1) {
		cout << "Please enter your binary string: " << endl;
		cin >> binary;
		int	decimal = binToDec(binary);
		cout << decimal << endl;
		main(); //to restart program
	}
	else if (answer == 0) {
		cout << "Enter a decimal integer: " << endl;
		cin >> decimal2;
		decToBin(decimal2);
		main();
	}
	else if (answer > 1 || answer < 0) {
		cout << "Please enter 0 or 1" << endl;
		main();
	}
	return 0;
}