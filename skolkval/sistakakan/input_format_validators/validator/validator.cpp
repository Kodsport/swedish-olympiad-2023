#include "validator.h"
#include <cmath>

#define sz(v) int(v.size())

void run() {
	int n = Arg("n");
	int m = Arg("m");
	Int(1, n);
	Space();
	Int(1, m);
	Space();
	Int(1, n*m);
	Endl();
}
