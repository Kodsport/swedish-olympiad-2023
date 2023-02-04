#include "validator.h"
#include <algorithm>

struct UF {
	vector<int> e;
	UF(int n) : e(n, -1) {}
	bool sameSet(int a, int b) { return find(a) == find(b); }
	int size(int x) { return -e[find(x)]; }
	int find(int x) { return e[x] < 0 ? x : e[x] = find(e[x]); }
	bool join(int a, int b) {
		a = find(a), b = find(b);
		if (a == b) return false;
		if (e[a] > e[b]) swap(a, b);
		e[a] += e[b]; e[b] = a;
		return true;
	}
};

const int maxN = 200000;
const int maxQ = 500000;

void run() {
	int n = Int(3, Arg("maxN", maxN)); Space(); int q = Int(1, Arg("maxQ", maxQ)); Endl();
	string mode = Arg("modeTree", "No");
	bool line = mode == "line";
	
	vector<vector<int>> edges(n);
	UF uf(n);
	for (int i = 0; i < n - 1; i++) {
		int a = Int(1, n);
		Space();
		int b = Int(1, n);
		Endl();
		a--; b--;

		assert(uf.join(a, b));
		edges[a].push_back(b);
		edges[b].push_back(a);
	}
	assert(uf.size(0)==n);
	if (line)
	{
		for (int i = 0; i < n-1; i++)
		{
			bool works = 0;
			for (int j = 0; j < edges[i].size(); j++) if (edges[i][j]==i+1) works=1;
			assert(works);
		}
	}
	


	int a_Hi = Arg("maxA", int(1e9));
	SpacedInts(n,1,a_Hi);
	bool endAtOne = Arg("endAtOne", 0);

	for (int i = 0; i < q; i++)
	{
		int s = Int(1, n); Space(); int e = Int(1, n); Space(); int v = Int(1, int(1e9)); Endl();
		if (endAtOne) assert(e==1);
	}
	Eof();
}
