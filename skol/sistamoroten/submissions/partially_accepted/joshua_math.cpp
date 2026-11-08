// Gets around 80 if you use gcc
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

vector<long double> cache;
inline long double fact(int k)
{
    if (cache[k] != -1) return cache[k];
    return cache[k] = lgammal(k + 1);
}

long double choose(int n, int k)
{
    return fact(n) - fact(k) - fact(n - k);
}

int main()
{
    int n, m, k;
    cin >> n >> m >> k;

    cache.resize(n * m, -1);

    long double tot = n * log(m);

    vector<long double> v;
    repp(t, n, n * m + 1)
    {
        long double ans = 0;
        rep(i, (t - n) / m + 1)
        {
            long double a = choose(n, i) + choose(t - i * m - 1, n - 1) - tot;
            ans += expl(a) * ((i % 2 == 0) ? 1 : -1);
        }
        v.push_back(ans);
    }

    sort(v.rbegin(), v.rend());

    double ans = 0;
    rep(i, k) ans += v[i];
    cout << setprecision(15) << ans << endl;
    return 0;
}
