#include "validator.h"

// Example validator for the format:
// n m k
// a_1 a_2 ... a_n (1 <= a_i <= k)
// u_1 v_1
// ...
// u_m v_m

void run() {
	Int(1, Arg("A"));
	Endl();
	int N = Int(1, Arg("N"));
	Endl();
	SpacedInts(N, 1, 1'000'000'000);
}
