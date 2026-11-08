#include <bits/stdc++.h>
using namespace std;

using ll = long long;
using vi = vector<ll>;
using vvi = vector<vi>;
using p2 = pair<ll, ll>;
const ll inf = 1e18;

#define rep(i,n) for (ll i = 0; i < (n); i++)
#define repp(i,a,n) for (ll i = (a); i < (n); i++)
#define repe(i, arr) for (auto& i : arr)
#define all(x) begin(x),end(x)
#define sz(x) ((ll)(x).size())


#define AIR 0
#define WATER 1
#define STONE 2

int main() {
    cin.tie(0)->sync_with_stdio(0);

    int r, c, k, n;
    cin >> r >> c >> k >> n;
    vector<int> cols(k);
    rep(i, k) cin >> cols[i];
    vector<p2> obstacles(n);
    rep(i, n) cin >> obstacles[i].first >> obstacles[i].second;

    vvi grid(r+2, vi(c, AIR));
    
    rep(i, n) grid[obstacles[i].first][obstacles[i].second] = STONE;


    rep(i, k)
    {
        queue<p2> q;
        q.emplace(r + 1, cols[i]);

        while (q.size())
        {
            p2 p = q.front();
            q.pop();

            if (p.second < 0 || p.second >= c) continue;
            if (grid[p.first][p.second] > 0) continue; // Air or stone
            grid[p.first][p.second] = WATER;
            if (p.first == 0) continue;

            if (grid[p.first-1][p.second]==STONE)
            {
                q.emplace(p.first, p.second + 1);
                q.emplace(p.first, p.second - 1);
            }
            else
            {
                q.emplace(p.first - 1, p.second);
            }
        }
    }

    int ans = 0;
    rep(i, c) ans += grid[0][i] == WATER;
    cout << ans << '\n';

    return 0;
}
