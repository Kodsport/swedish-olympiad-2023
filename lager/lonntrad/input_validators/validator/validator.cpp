#include "validator.h"

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
	int N = Int(3, Arg("n"));
	Endl();
	vector<int> deg(N);
	UF uf(N);
	for (int i = 0; i < N - 1; i++) {
		int a = Int(0, N-1);
		Space();
		int b = Int(0, N-1);
		Space();
		Int(0, 1'000'000'000'000LL);
		Endl();
		assert(uf.join(a, b));
		deg[a]++;
		deg[b]++;
	}
	bool line = Arg("line", 0);
	for (int i = 0; i < N; i++) {
		assert(deg[i] <= (line ? 2 : 3));
	}
}
