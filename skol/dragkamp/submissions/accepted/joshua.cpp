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

int a1 = 0, a2 = 0, a3 = 0, a4 = 0;
void brute(int str, int sz, vi& strengths, vi& choice) {
    bool all_zero = true;
    rep(i, 4) if (strengths[i]) all_zero = false;
    if (all_zero)
    {
        if (str != 0 || sz != 0) return;

        cout << a1 + choice[0] << " " << a2 + choice[1] << " " << a3 + choice[2] << " " << a4 + choice[3];

        exit(0);
    }

    rep(i, 4)
    {
        if (strengths[i]) {
            strengths[i]--;

            choice[i]++;
            brute(str - (i + 1), sz - 1, strengths, choice);
            choice[i]--;

            brute(str + (i + 1), sz + 1, strengths, choice);

            strengths[i]++;
            break;
        }
    }
}


int main() {
    cin.tie(0)->sync_with_stdio(0);

    int s1,s2,s3,s4;
    cin >> s1 >> s2 >> s3 >> s4;

    while (s4 - 2 > 1) {
        a4++;
        s4 -= 2;
    }

    while (s3 - 2 > 2) {
        a3++;
        s3 -= 2;
    }

    while (s2 - 2 > 4) {
        a2++;
        s2 -= 2;
    }

    while (s1 - 2 > 8) {
        a1++;
        s1 -= 2;
    }

    // At this point, both teams have equal strength and size
    vi strengths = {s1,s2,s3,s4};
    vi choice = {0,0,0,0};
    brute(0, 0, strengths, choice);
    assert(0);

    return 0;
}
