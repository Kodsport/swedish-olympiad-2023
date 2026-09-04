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


int main() {
    cin.tie(0)->sync_with_stdio(0);

    int r,c,k,n;
    cin >> r >> c >> k >> n;
    vector<int> cols(k);
    rep(i, k) cin >> cols[i];
    vector<p2> obstacles(n);
    rep(i, n) cin >> obstacles[i].first >> obstacles[i].second;

    set<int> haswater;
    rep(i, k) haswater.insert(cols[i]);
    map<int, vi> rows;
    rep(i, n) rows[-obstacles[i].first].emplace_back(obstacles[i].second);

    repe(row, rows)
    {
        repe(col, row.second)
        {
            if (haswater.count(col))
            {
                haswater.erase(col);
                haswater.insert(col - 1);
                haswater.insert(col + 1);
            }
        }
    }

    if (haswater.count(-1)) haswater.erase(-1);
    if (haswater.count(c)) haswater.erase(c);
    cout << sz(haswater) << '\n';

    return 0;
}
