#include "validator.h"

typedef long long ll;

const int MAXPROD = 1e5;
const int MAXHEIGHT = 1e9;

void run() {
    int n = Int(1, Arg("max_n"));
    Space();
    int k = Int(Arg("min_k", 0), Arg("max_k", 20));
    Endl();

    int prev = 0;
    vector<int> vec = SpacedInts(n, 1, MAXHEIGHT);

    if (Arg("increasing", false))
        for (int i = 1; i < n; ++i) 
            if (vec[i] <= vec[i - 1])
                die_line("Not increasing at index " + to_string(i));
    
    Eof();
}
