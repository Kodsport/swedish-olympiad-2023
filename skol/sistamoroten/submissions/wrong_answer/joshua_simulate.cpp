// Gets 20-60 depending on float tolerance
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

    vi frequency(n * m + 1);

    mt19937 rng(1234);
    uniform_int_distribution<int> dist(1, m);

    int i = 0;
    auto start = chrono::high_resolution_clock::now();
    while (true)
    {
        int roll = 0;
        rep(i, n) roll += dist(rng);
        frequency[roll]++;

        i++;
        if (i % 10000 == 0 && (chrono::duration_cast<chrono::milliseconds>(chrono::high_resolution_clock::now()-start).count() > 980)) break;
    }

    sort(frequency.rbegin(), frequency.rend());
    double ans = 0;
    rep(i, k) ans += frequency[i];
    ans /= accumulate(all(frequency), 0);
    cout << setprecision(15) << ans << endl;
    return 0;
}