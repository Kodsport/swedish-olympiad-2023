#include "validator.h"

void run() {
	int mxS = Int(0, Arg("mxS", 10'000'000));
    bool no4 = Arg("no4", false);
    bool exists = Arg("exists", false);

    int a = Int(0, mxS); Space();
    int b = Int(0, mxS); Space();
    int c = Int(0, mxS); Space();
    int d = Int(0, no4 ? 0 : mxS); Endl();

    if (exists) {
        bool odd2no13 = a == 0 && c == 0 && b%2;
        bool single23 = (b + c) == 1;
        bool odd12no24 = a%2 && b == 0 && d == 0;
        assert(!odd2no13 && !single23 && !odd12no24);
    }
}
