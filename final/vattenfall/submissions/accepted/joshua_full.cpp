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

// Pretty ugly sweep solution
int main()
{
    cin.tie(0)->sync_with_stdio(0);

    int r,c,k,n;
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
        while (it != row.second.end())
        {
            int rownr = row.first;
            if (haswater.count(*it))
            {
                haswater.erase(*it);
                auto itl = it;
                bool works = 1;
                while (1)
                {
                    if (*itl - 1 < 0)
                    {
                        works = 0;
                        break;
                    }
                    if (rows.count(rownr - 1) && rows[rownr - 1].count(*itl - 1))
                    {
                        works = 0;
                        break;
                    }
                    if (haswater.count(*itl)) break;


                    if ((itl == row.second.begin() || *itl - 1 != *prev(itl)))
                    {
                        break;
                    }
                    itl = prev(itl);
                }

                if (works && *itl - 1 >= 0)
                {
                    haswater.insert(*itl - 1);
                }



                works = 1;
                while (it != prev(row.second.end()) && *it + 1 == *next(it))
                {
                    haswater.erase(*it + 1);
                    if (rows.count(rownr - 1) && rows[rownr - 1].count(*it + 1))
                    {
                        works = 0;
                        break;
                    }
                    it++;
                }
                if (works)
                {
                    int v;
                    if (it == row.second.end()) v = *prev(it);
                    else v = *it;

                    if (v + 1 < c && !(rows.count(rownr - 1) && rows[rownr - 1].count(v + 1))) haswater.insert(v + 1);
                }

            }
            it++;
        }
    }


    cout << sz(haswater) << '\n';

    return 0;
}
