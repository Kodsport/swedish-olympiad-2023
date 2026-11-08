// Approximation with normal distribution
// If combined with fft, can solve for all n,m,k with a pretty high error
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

long double normalCDF(long double dev, int k)
{
    return 0.5 * erfl(1 / (dev *sqrt(2))*k/2);
}

long double normalCDF(int n, int m, int k)
{
    long double dev = sqrtl(n * (m * m - 1) / 12);

    return normalCDF(dev, k)*2;
}

int main()
{
    int n,m,k;
    cin >> n >> m >> k;
    
    cout << setprecision(15) << normalCDF(n,m,k) << endl;
    return 0;
}
