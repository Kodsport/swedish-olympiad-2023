#include "validator.h"
#include <set>

void run() {
    int maxR = Arg("r");
    int maxC = Arg("c");
    int maxN = Arg("n");
    int maxV = Arg("maxv", 1000);
    string ignore = Arg("noise");
    int ignore_ = Arg("t");
    string ignore_1 = Arg("bandsz","asd");
    string ignore_2 = Arg("roundthresh","asd");

    

    
    int t = Int(0, 10); Endl();
    int r = Int(1, maxR); Space(); int c = Int(1, maxC); Space(); int n = Int(1, maxN); Endl();

    // TODO: check not too close to average
    for (int i = 0; i < r; i++) 
    {
        SpacedInts(c, 0, maxV);
    }

    Eof();
}
