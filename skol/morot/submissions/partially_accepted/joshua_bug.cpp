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
    int t,m;
    cin >> t >> m;

    int next_t = 0;
    int next_m = 0;
    int n_carrot = 40;

    int eaten_t = 0;
    int eaten_m = 0;

    int time = 0;
    while (n_carrot > 0)
    {
        // Test that this fails
        //if (next_t == time && next_m == time && n_carrot == 1) break;

        if (next_t == time)
        {
            n_carrot--;
            eaten_t++;
            next_t = time + t;
        }
        if (next_m == time)
        {
            n_carrot--;
            eaten_m++;
            next_m = time + m;
        }
        time++;
    }

    cout << eaten_t << " " << eaten_m;

    return 0;
}
