// stringSort.cpp : Defines the entry point for the console application.
//Jay Banerji
//CS162 Fall 2016
//A program to sort strings alphabetically, regardless of capitlization


#include <iostream>
#include <string>
#include <stdio.h>
#include <ctype.h>

using namespace std;
void sarray(string[]);
void makelist(string words[], int size);
void stringSort(string words[], int size);
void capitolise(string words[], int size, int* minIndex, int i);

int main()
{
	string words[10] = { "When","coward","Despot","roar","Juniper","quest","forty seven","React","memes","hello" };
	int size = 10;
	int x;
	makelist(words, size);
	cout << endl;
	stringSort(words, size);
	makelist(words, size);
    return 0;
}

void stringSort(string words[], int size) {
	int minIndex;
	string placeholder;
	for (int i = 0; i < size; i++) {
		minIndex = i;
		capitolise(words, size, &minIndex, i);
		if (minIndex != i) {
			placeholder = words[i];
			words[i] = words[minIndex];
			words[minIndex] = placeholder;
		}
	}
}

void makelist(string words[], int size) {
	for (int i = 0; i < size; i++) {
		cout << words[i] << endl;
	}
}

void capitolise(string words[], int size, int x, int* minIndex, int i) {
	string string1, string2;
	for (int x = i + 1; x < size; x++) {
		string string1letter = words[*minIndex];
		string1 = toupper(string1letter[0]);
		string string2letter = words[x];
		string2 = toupper(string2letter[0]);
		if (string2 < string1) {
			*minIndex = x;
		}
	}

}