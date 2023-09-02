#include "validator.h"
#include <bits/stdc++.h>

void run() {
    int maxR = Arg("r", 1000000000);
    int maxC = Arg("c", 1000000000);
    int maxN = Arg("n", 100000);
    int maxK = Arg("k", 100000);
    bool nodiag = Arg("nodiag",0);
    bool noaxis = Arg("noaxis",0);
    
    int r = Int(1, maxR); Space(); int c = Int(1, maxC); Endl();
    int k = Int(1, maxK); Space(); int n = Int(1, maxN); Endl();
    
    set<int> seen;
    for (int i = 0; i < k; i++)
    {
        int col = Int(0, c-1); Endl();
        seen.insert(col);
    }
    assert(seen.size()==k);

    set<pair<int,int>> seenpoints;
    for (int i = 0; i < n; i++)
    {
        int pr = Int(1, r-1); Space(); int pc = Int(0,c-1); Endl();
        seenpoints.emplace(pr,pc);
    }
    assert(seenpoints.size()==n);


    Eof();
}
