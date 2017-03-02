#ifndef CUSTOMERPROJECT_HPP
#define CUSTOMERPROJECT_HPP

using namespace std;

class CustomerProject {
	protected:
		double hours;
		double materials;
		double transportation;
	public:
		double getHours();
		double getMaterials();
		double getTransportation();
		void setHours(double h);
		void setMaterials(double m);
		void setTransportation(double t);
		CustomerProject(double h, double m, double t);
		virtual double billAmount()=0; 
};
#endif
