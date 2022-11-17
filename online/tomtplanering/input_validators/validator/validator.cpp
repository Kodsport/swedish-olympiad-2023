#include "validator.h"

void run() {
    int t = Arg("t", 0);
    int T = Int(0, 10); Endl();
    assert(T == t);
    
	int N = Int(1, 100000); Endl();
    assert(N%2 == 0);
    set<pair<int,int>> seen;
    for(int c1 = 0; c1 < N; c1++){
        int x = Int(0, 1000000);
        Space();
        int y = Int(0, 1000000);
        Endl();
        pair<int,int> p = {x, y};
        assert(seen.find(p) == seen.end());
        seen.insert(p);
    }
}
