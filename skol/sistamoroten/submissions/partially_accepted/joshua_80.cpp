// Should get 80
#include <bits/stdc++.h>
using namespace std;

typedef long long ll;
const ll inf = 1e18;

#define rep(i, b) for(ll i = 0; i < (b); i++)
#define repp(i, a, b) for(ll i = a; i < (b); i++)
#define repe(i,arr) for (auto& i : arr)
#define all(x) begin(x), end(x)
#define sz(x) ((ll)(x).size())
typedef pair<ll, ll> p2;
typedef vector<ll> vi;
typedef vector<vi> vvi;

int main()
{
    int n,m,k;
    cin >> n >> m >> k;
    vi items;
    repp(j, 1, m + 1) items.push_back(j);


    vector<double> dp(m * n + 1);
    dp[0] = 1;
    vector<double> newdp(dp.size());
    rep(j, n)
    {
        rep(i, dp.size())
        {
            repe(item, items)
            {
                if (i - item >= 0)
                {
                    newdp[i] += dp[i - item];
                }
            }
            newdp[i] /= items.size();
        }
        dp = newdp;
        newdp = vector<double>(dp.size());
    }


    sort(dp.rbegin(), dp.rend());
    double ans = 0;
    rep(i, k) ans += dp[i];
    cout << setprecision(15) << ans << endl;
    return 0;
}