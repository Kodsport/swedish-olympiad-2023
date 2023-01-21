#include "validator.h"
#include <set>
#include <pair>

void run() {
    int maxR = Arg("r", int(1e9));
    int maxC = Arg("c", int(1e9));
    int maxN = Arg("n");
    int maxK = Arg("k");

    
    int r = Int(1, maxR); Space(); int c = Int(1, maxC); Endl();
    int n = Int(1, maxN); Space(); int k = Int(1, maxK); Endl();

    set<int> seen;
    for (int i = 0; i < k; i++)
    {
        int col = Int(0, c-1); Endl();
        set.insert(col);
    }
    assert(seen.size()==k);

    set<pair<int,int>> seenpoints;
    for (int i = 0; i < n; i++)
    {
        int pr = Int(0, r-1); Space(); int pc = Int(0,c-1); Endl();
        seenpoints.emplace(pr,pc);
    }
    assert(seenpoints.size()==n);


    Eof();
}
