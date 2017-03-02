#ifndef MYINTEGER_HPP
#define MYINTEGER_HPP

class MyInteger {
	private:
		int* pInteger;
	protected:
	public:
		MyInteger(int Num); //Constructor
		~MyInteger();	//Destructor
		MyInteger(MyInteger &obj);	//Copy Constructor
		void setMyInt(int Num); //Set Method
		int getMyInt();	//Get Method
		MyInteger& operator=(MyInteger);
	};
#endif
