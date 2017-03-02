#include <stack>
#include <string>
#include <iostream>

using namespace std;

bool isOp(char c);
double doOp(char op, double op1, double op2);
bool isNum(char c);

double postfixEval (string input) {
	stack<double> S;
	for(int i=0; i<input.length(); i++) {
		if (input[i] == ' ' || input[i] == ',') {
			continue;
		}
		else if(isOp(input[i])) {
			double op2 = S.top(); S.pop();
			double op1 = S.top(); S.pop();
			double result = doOp(input[i], op1, op2);
			S.push(result);
		}
		else if(isNum(input[i])) {
			double op =0;
			while(i<input.length() & isNum(input[i])) {
				op = (op*10) + (input[i] -'0');
				i++;
			}
			i--;
			S.push(op);
		}
	}
	return S.top();
}

bool isNum(char c) {
	if (c >= '0' && c <= '9') {
		return true;
	}
	else {
		return false;
	}
}
bool isOp(char c) {
	if (c == '+' || c == '-' || c == '*' || c == '/') {
		return true;
	}
	else {
		return false;
	}
}

double doOp(char op, double op1, double op2) {
	if (op == '+') {
		return op1 + op2;
	}
	else if (op == '-') {
		return op1 - op2;
	}
	else if (op == '*') {
		return op1 * op2;
	}
	else if (op == '/') {
		return op1 / op2;
	}
	else {
		cout << "ERROR ERROR DELETE system32" <<endl;
		return -1;
	}
}

int main() {
	string input;
	cout << "Plz enter postfix" << endl;
	getline(cin, input);
	double result = postfixEval(input);
	cout << "Result is: " << result << endl;
}

