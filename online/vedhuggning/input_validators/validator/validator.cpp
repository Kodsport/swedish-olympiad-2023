#include "validator.h"

void run() {
    int maxN = Arg("maxN", 200'000);
    int maxS = Arg("maxS", 1'000'000'000);

    int N = Int(1, maxN); Space();
    long long S = Int(1, maxS); Endl();

    for (int i = 0; i < N; i++) {
        int l = Int(0, 1'000'000'000); Space();
        int v = Int(0, 1'000'000'000); Space();
        int t = Int(0, 1'000'000'000); Endl();

        S -= l + v * t;
    }

    assert(S <= 0); // check that the total growth is enough
}
