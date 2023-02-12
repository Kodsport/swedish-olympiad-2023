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

struct UF {
	vector<int> v;
	UF(int n) : v(n, -1) {}
	int find(int x) { return v[x] < 0 ? x : v[x] = find(v[x]); }
	bool join(int a, int b) {
		a = find(a);
		b = find(b);
		if (a == b) return false;
		if (-v[a] < -v[b]) swap(a, b);
		v[a] += v[b];
		v[b] = a;
		return true;
	}
};



void run() {
    int N = Int(1, Arg("maxn")); Space();
    int F = Int(1, min(N, (int)Arg("maxf"))); Endl();
	bool line = Arg("line", 0);

	UF uf(N);
	for (int i = 0; i < N - 1; i++) {
		int a = (int)Int(1, N) - 1;
		Space();
		int b = (int)Int(1, N) - 1;
		Endl();
		assert(uf.join(a, b));
        if (line) {
            assert(a == i && b == i + 1);
        }
	}
    vector<int> fs = SpacedInts(F, 1, N);
    assert((int)set<int>(all(fs)).size() == F);
}
