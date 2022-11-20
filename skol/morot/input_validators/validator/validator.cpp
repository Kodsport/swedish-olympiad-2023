#include "validator.h"

void run() {
    bool nosame = Arg("nosame", 0);

    int maxtime = Arg("maxtime", 100);
    int M = Int(1, maxtime); Space();
    int T = Int(1, maxtime); Endl();

    if (nosame) {
        int t = 1;
        int c = 38;
        while (c) {
            assert(t%M || t%T);
            if (t%M == 0 || t%T == 0) --c;
            t++;
        }
    }
}
