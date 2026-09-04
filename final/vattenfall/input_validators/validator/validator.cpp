#include "validator.h"

const int MAX_SIDELEN = 1e9;
const int MAX_K = 1e5;
const int MAX_N = 1e5;

using ll = long long;

void run() {
    bool nodiag = Arg("nodiag",0);
    bool noaxis = Arg("noaxis",0);
    
    int r = Int(2, MAX_SIDELEN);
    Space();
    int c = Int(1, MAX_SIDELEN);
    Endl();

    ll num_cells = (ll)r * c;
    ll max_cells = Arg("max_cells", (ll)MAX_SIDELEN * MAX_SIDELEN);
    assert(num_cells <= max_cells);

    int k = Int(1, Arg("k", MAX_K));
    Space();
    int n = Int(1, Arg("n", MAX_N));
    Endl();
    
    set<int> seen;
    for (int i = 0; i < k; i++)
    {
        int col = Int(0, c-1); Endl();
        seen.insert(col);
    }
    assert(seen.size()==k);

    vector<pair<int,int>> seenpoints;
    for (int i = 0; i < n; i++)
    {
        int pr = Int(1, r-1); Space(); int pc = Int(0,c-1); Endl();
        seenpoints.emplace_back(pr, pc);
    }
    AssertUnique(seenpoints);

    ranges::sort(seenpoints);
    vector<pair<int,int>> axis_directions = {{-1,0},{1,0},{0,-1},{0,1}};
    vector<pair<int,int>> diag_directions = {{-1,-1},{-1,1},{1,-1},{1,1}};
    for (auto [pr, pc] : seenpoints) {
        if (noaxis) {
            for (auto [dr, dc] : axis_directions) {
                if (ranges::binary_search(seenpoints, make_pair(pr + dr, pc + dc))) {
                    assert(false);
                }
            }
        }
        if (nodiag) {
            for (auto [dr, dc] : diag_directions) {
                if (ranges::binary_search(seenpoints, make_pair(pr + dr, pc + dc))) {
                    assert(false);
                }
            }
        }
    }
}
