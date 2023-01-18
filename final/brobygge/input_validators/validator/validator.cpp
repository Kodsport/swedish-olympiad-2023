#include "validator.h"
#include <set>

void run() {
    int maxN = Arg("maxn", int(1e9));
    int maxM = Arg("maxm", int(1e9));
    int maxT = Arg("maxt", int(1e5));

    int n = Int(1, maxN); Space(); int m = Int(1, maxM); Space(); int t = Int(1, maxT); Endl();

    assert(n>=3);

    std::set<std::pair<int,int>> seen;
    for (int i = 0; i < t; i++)
    {
        int r = Int(1, n-2); Space(); int c = Int(0, m-1); Endl();
        std::pair<int,int> p = {r,c};
        assert(seen.find(p)==seen.end());
        seen.insert(p);
    }

    Eof();
}
