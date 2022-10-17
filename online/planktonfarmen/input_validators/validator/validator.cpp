#include "validator.h"

void run() {
	Int(1, Arg("A"));
	Endl();
	int N = Int(1, Arg("N"));
	Endl();
	SpacedInts(N, 1, 1'000'000'000);
}
