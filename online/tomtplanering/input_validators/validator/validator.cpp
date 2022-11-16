#include "validator.h"

void run() {
    int t = Arg("t", 0);
    int T = Int(0, 10); Endl();
    assert(T == t);
    
	int N = Int(1, 100000); Endl();
    assert(N%2 == 0);
    for(int c1 = 0; c1 < N; c1++){
        Int(0, 1000000);
        Space();
        Int(0, 1000000);
        Endl();
    }
}
