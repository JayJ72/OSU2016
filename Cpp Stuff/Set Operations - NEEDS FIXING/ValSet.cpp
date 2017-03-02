/******************************************
 Jay Banerji
 CS162 
 Assignment 5
******************************************/
#include "ValSet.hpp"
#include <vector>
#include <iostream>
using namespace std;

//As is with life, by default you are worth NOTHING
template <class T>
ValSet<T>::ValSet() {
	mySize = 10;
	setSize = 0;
	T* mySet = new T[mySize]; //Dynamically allocates
	for (int i=0; i<mySize; i++) {
		mySet[i] = 0; //Sets the values to 0
	}
}	

template <class T>
ValSet<T>::ValSet(const ValSet<T> &obj) { //Copy constructors
	setSize = obj.setSize;
	mySize = obj.mySize;
	if (setSize > mySize) {
		mySet = new T[setSize]; //Dynamically allocates if needs to be larger
		mySize = setSize; //Because it needs to be the same derr
	}
	//memcpy(this->values, copy.values, sizeof(T)*copy.full
	for (int i=0; i<mySize; i++) {
		mySet[i] = obj.mySet[i]; //Makes them equal
	}
	//delete[] mySet;
}

template <class T> 
ValSet<T> ValSet<T>::operator = (const ValSet<T> &obj) { //Operator overloads
	setSize = obj.size(); //All the same shit as above
	mySet = new T[setSize];
	for (int i=0; i<mySize; i++) {
		mySet[i] = obj[i];
	}
	delete[] mySet;
	return *this; //Important for some reason
}

template <class T>
ValSet<T>::~ValSet() {
	delete[] mySet; //idk if this is right but w/e
}

template <class T>
int ValSet<T>::size() {
	return setSize; //Seems too simple to be the case
}

template <class T>
bool ValSet<T>::isEmpty() {
	if (mySize == 0) {
		return true;
	}
	else {
		return false;
	}
}

template <class T>
bool ValSet<T>::contains(T jet) {
	T* mySet;
	for (int i=0; i<setSize; i++) { //simple linear search
		if (mySet[i] == jet) {
			return true;
		}
	}
	return false;
}
//The add function is fucked. SEGFAULT CITYYYYYYYYYYYYYYYYYYYYYYYYYy
template <class T>
void ValSet<T>::add(T fuel) {
	if (contains(fuel)) {
	if (setSize >= mySize) {
		T* myOldSet = mySet; //create temp var
		mySet = new T[mySize*2];
		for (int i=0; i<setSize; i++) {
			mySet[i] = myOldSet[i]; //make sure it fills the same
		}
		delete[] myOldSet; //deallocate
	}
	setSize++;
	mySet[setSize] = fuel; //Because setSize = 9, 9th val is at position 8. So push to position 9
	}
}

template <class T>
void ValSet<T>::remove(T cant) { //REMOVE KEBAB
	T* myOldSet = mySet;
	mySet = new T[mySize];
	if (contains(cant) == true) {
		for (int i=0; i<setSize-1; i++) {
			if (mySet[i] == cant) { //Reorder array and make it die
				mySet[i] = mySet[i+1];
				mySet[setSize-1] =0;
				setSize--;
			}
		}		
	}
}

template <class T>
ValSet<T> ValSet<T>::unionWith(ValSet melt) { //I don't know if this works because I can't test it
	int newSize = melt.size() + mySize;
	T* myOldSet = mySet;
	mySet = new T[newSize]; 
	for (int i=0; i<newSize; i++) {
		mySet[i] = melt[i];
		mySet[i+melt.size()] = myOldSet[i]; //it's this way because i don't want it to overlap
	}
	return mySet;	
}

template <class T>
ValSet<T> ValSet<T>::intersectWith(ValSet steel) { //again, can't test
	T* myOldSet = mySet;
	mySet = new T[mySize];
	int count = 0;
	for (int i=0; i<mySize; i++) {
		for (int z=0; z<steel.size(); z++) {
			if (myOldSet[i] == steel[z]) {
				mySet[count] = myOldSet[i]; //i mean, this shit seems clever because then it wont be in random positions
				count++;
			}
		}
	}
	return mySet;
}

template <class T>
ValSet<T> ValSet<T>::symmDiffWith(ValSet beams) { //see above
	T* myOldSet = mySet;
	mySet = new T[mySize];
	T* mySetA = myOldSet.intersectWith(beams);
	T* mySetB = myOldSet.unionWith(beams);
	for (int i=0; i<mySetA.size(); i++) {
		mySetB.remove(mySetA[i]); //works logically, no?
	}
	mySet = mySetB;
	return mySet;
}

template <class T>
vector<T> ValSet<T>::getAsVector(ValSet didNineEleven) {
	mySet;
	for (int i=0; i<setSize; i++) {
		didNineEleven.push_back(mySet[i]) = mySet[i];
	}
	return didNineEleven;
}

/*
template class ValSet<int>;
template class ValSet<char>;
template class ValSet<string>;
*/
int main() {
	ValSet<char> mySet;
	mySet.add('A');
	mySet.add('j');
	mySet.add('&');
	mySet.remove('j');
	mySet.add('#');
	int size = mySet.size();
	ValSet<char> myOldSet = mySet;
	bool check1 = myOldSet.contains('&');
	bool check2 = myOldSet.contains('j');
	return 0;
}

