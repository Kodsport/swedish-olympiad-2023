#include "validator.h"

typedef long long ll;

const int MAXPROD = 1e5;
const int MAXHEIGHT = 1e9;

void run() {
    int n = Int(1, Arg("max_n"));
    Space();
    int k = Int(Arg("min_k"), Arg("max_k"));
    Endl();

    bool increasing = Arg("increasing");
    int prev = 0;
    vector<int> vec = SpacedInts(n, 1, MAXHEIGHT);

    if (increasing)
        for (int i = 1; i < n; ++i) 
            if (vec[i] <= vec[i - 1])
                die_line("Not increasing at index " + to_string(i));
    
    Eof();
}
