#ifndef PREFERREDPROJECT_HPP
#define PREFERREDPROJECT_HPP
#include "CustomerProject.hpp"
class PreferredProject : public CustomerProject {
	public:
		PreferredProject(double h, double m, double t) : CustomerProject(h, m, t) {
		}
		double billAmount();
};

#endif
