#include "validator.h"

void dfs(int at, const vector<vector<int>>& G, vector<bool>& seen) {
    if (seen[at]) return;
    seen[at] = true;
    for (int it: G[at]) dfs(it, G, seen);
}

void run() {
    int maxN = Arg("maxN", 200'000);
    bool isstar = Arg("isstar", 0);

    int N = Int(1, maxN); Endl();

    vector<vector<int>> G(N);
    for (int i = 0; i < N - 1; i++) {
        int a = Int(0, N - 1); Space();
        int b = Int(0, N - 1); Endl();
        G[a].push_back(b);
        G[b].push_back(a);
    }

    if (isstar) {
        for (int i = 1; i < N - 1; i++) assert((int)G[i].size() <= 2);
    }

    vector<bool> seen(N);
    dfs(0, G, seen);
    assert(!count(seen.begin(), seen.end(), false));
}
