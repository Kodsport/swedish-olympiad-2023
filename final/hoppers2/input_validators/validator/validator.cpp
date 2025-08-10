#include "validator.h"
#include<bits/stdc++.h>
#include <set>

void run() {
    int maxN = Arg("maxn");
    int maxtiles = Arg("maxtiles");
    bool noup = Arg("noup", 0);

    int r = Int(1, maxtiles); Space(); int c = Int(1, maxtiles); Space(); int n = Int(1, maxN); Endl();

    assert(r * c <= maxtiles);
    assert(r*c > 1);

    vector<string> grid(r, string(c, '-'));
    for (int i = 0; i < r; i++)
    {
        for (int j = 0; j < c; j++) grid[i][j] = Char();
        Endl();
        for (int j = 0; j < c; j++)
        {
            if (noup) assert(grid[i][j] != '^');
            assert(grid[i][j]=='<'||grid[i][j]=='>'||grid[i][j]=='v'||grid[i][j]=='^');
        }
        
    }

    for (int i = 0; i < r; i++)
    {
        assert(grid[i][0]!='<');
        assert(grid[i][c-1]!='>');
    }

    for (int i = 0; i < c; i++)
    {
        assert(grid[0][i]!='^');
        assert(grid[r-1][i]!='v');
    }

    set<pair<int,int>> seen;
    for (int i = 0; i < n; i++)
    {
        int pr = Int(0, r-1); Space(); int pc = Int(0, c-1); Endl();
        seen.emplace(pr,pc);
    }
    assert(seen.size()==n);
    Eof();
}
