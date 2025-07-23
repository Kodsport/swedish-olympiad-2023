#include "validator.h"
#include <cmath>

#define sz(v) int(v.size())

void run() {
	int n = Arg("n");
	int minN = Arg("minN", 1);
	int m = Arg("m");
	Int(minN, n);
	Space();
	Int(1, m);
	Space();
	Int(1, n*m - 1);
	Endl();
}
