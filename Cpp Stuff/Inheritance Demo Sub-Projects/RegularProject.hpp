#ifndef REGULARPROJECT_HPP
#define REGULARPROJECT_HPP
#include "CustomerProject.hpp"
class RegularProject : public CustomerProject {
	public:
		RegularProject(double h, double m, double t) : CustomerProject(h, m, t) {
}
		double billAmount();
};

#endif
