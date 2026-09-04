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

    int r, c, k, n;
    cin >> r >> c >> k >> n;
    vector<int> cols(k);
    rep(i, k) cin >> cols[i];
    vector<p2> obstacles(n);
    rep(i, n) cin >> obstacles[i].first >> obstacles[i].second;

    set<int> haswater;
    rep(i, k) haswater.insert(cols[i]);
    map<int, set<int>> rows;
    rep(i, n) rows[-obstacles[i].first].insert(obstacles[i].second);

    repe(row, rows)
    {
        auto it = row.second.begin();
        while (it!=row.second.end())
        {
            if (haswater.count(*it))
            {
                haswater.erase(*it);
                auto itl = it;
                while (itl != row.second.begin() && *itl - 1 == *prev(itl)) itl = prev(itl);
                if (*itl - 1 >= 0) haswater.insert(*itl - 1);

                while (it != prev(row.second.end()) && *it + 1 == *next(it))
                {
                    haswater.erase(*it + 1);
                    it++;
                }
                if (*it + 1 < c) haswater.insert(*it + 1);
            }
            it++;
        }
    }

    if (haswater.count(-1)) haswater.erase(-1);
    if (haswater.count(c)) haswater.erase(c);
    cout << sz(haswater) << '\n';

    return 0;
}
