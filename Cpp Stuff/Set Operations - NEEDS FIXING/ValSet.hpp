#ifndef VALSET_HPP
#define VALSET_HPP
#include <vector>

using namespace std;

template <class T>
class ValSet {
	private:
		int mySize;
		int setSize;
		T *mySet;// = new T[length]; //dynamically allocated array of T
	public:
		ValSet(); //default constructor
		ValSet(const ValSet<T> &obj); //STOP COPYING ME
		~ValSet();//Destruction seems like a good thing now
		ValSet operator = (const ValSet<T> &obj);//FORCED EQUALITY
		int size(); //Tells you how FAT you are you f*ck
		bool isEmpty(); //Yes, it's now possible to measure how empty you are inside
		bool contains(T jet); //FIND IT
		void add(T fuel); //ADD IT
		void remove(T cant);//BOP IT!-I mean REMOVE IT!
		ValSet<T> unionWith(ValSet melt); //B
		ValSet<T> intersectWith(ValSet steel); //U
		ValSet<T> symmDiffWith(ValSet beams); //S
		vector<T> getAsVector(ValSet didNineEleven); //H
};
#endif
		
