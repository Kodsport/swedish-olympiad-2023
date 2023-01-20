#include "validator.h"
#include <set>

void run() {
    int maxR = Arg("r");
    int maxC = Arg("c");
    int maxN = Arg("nsize");
    int maxV = Arg("maxv", 1000);
    string ignore = Arg("base_noise");
    int ignore_ = Arg("t");
    
    int t = Int(0, 10); Endl();
    int r = Int(1, maxR); Space(); int c = Int(1, maxC); Space(); int n = Int(1, maxN); Endl();

    // TODO: check not too close to average
    for (int i = 0; i < r; i++) 
    {
        for (int j = 0; j < c; j++)
        {
            Int(0, maxV); 
            Space();
        }
        Endl();
    }

    Eof();
}
