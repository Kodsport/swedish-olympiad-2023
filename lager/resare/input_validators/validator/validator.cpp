#include "validator.h"
#include <algorithm>

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
	int n = Int(3, Arg("maxN")); Space(); int q = Int(1, Arg("maxQ")); Endl();
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
	for (int i = 0; i < n; i++) {
		int v = Int(1, a_Hi);
	}

	bool endAtOne = Arg("endAtOne", 0);

	for (int i = 0; i < q; i++)
	{
		int s = Int(1, n); Space(); int e = Int(1, n); Space(); int v = Int(1, int(1e9)); Endl();
		if (endAtOne) assert(e==1);
	}
	Eof();
}
