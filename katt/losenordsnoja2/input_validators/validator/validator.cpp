#include "validator.h"

#include <bits/stdc++.h>
using namespace std;

#define rep(i, a, b) for(int i = a; i < (b); ++i)
#define trav(i, a) for(auto& i : a)
#define all(x) begin(x), end(x)
#define sz(x) (int)(x).size()
typedef long long ll;
typedef pair<int, int> pii;
typedef vector<int> vi;

void run() {
    int N = Int(1, Arg("maxn")); Space();
    bool linear = Arg("linear", 0);
    int expectedQ = linear ? N - 1 : ((N / 2) * (N / 2));
    Int(expectedQ, expectedQ); Endl();

    bool valid = Arg("valid", 0);
    string S = Line();
    assert((int)S.size() == N);

    int bal = 0;
    for (char c : S) {
        if (c == '(') bal++;
        else if (c == ')') bal--;
        else assert(false);
        if (valid) assert(bal >= 0);
    }
    if (valid) assert(bal == 0);
}
