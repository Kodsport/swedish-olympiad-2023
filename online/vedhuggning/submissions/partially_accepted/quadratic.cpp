#include <bits/stdc++.h>
using namespace std;

#define rep(i, a, b) for(int i = a; i < (b); ++i)
#define trav(it,x) for(auto& it : x)
#define all(x) begin(x), end(x)
#define sz(x) (int)(x).size()
typedef long long ll;
typedef pair<int, int> pii;
typedef vector<int> vi;

template<typename T, typename S> ostream& operator<<(ostream& os, const pair<T, S> &v) { return os << v.first << " " << v.second; }
template<typename T, typename S> istream& operator>>(istream& is, const pair<T, S> &v) { return is >> v.first >> v.second; }
template<typename T> ostream& operator<<(ostream& os, const vector<T> &v) { rep(i,0,sz(v)) { if (i) os << " " << v[i]; else os << v[i]; } os << endl; return os; }
template<typename T> istream& operator>>(istream& is, vector<T> &v) { trav(it, v) is >> it; return is; }
template<typename T> using v = vector<T>; template<typename T> using vv = v<v<T>>; template<typename T> using vvv = v<v<v<T>>>;
template<typename T> std::vector<T> make(T init, std::size_t size) { return std::vector<T>(size, init); }
template<typename T, typename... Args> auto make(T init, std::size_t first, Args... sizes) { auto inner = make<T>(init, sizes...); return std::vector<decltype(inner)>(first, inner); }
template<typename A, typename B> auto smax(A& a, const B& b) { if (b > a) a = b; }
template<typename A, typename B> auto smin(A& a, const B& b) { if (b < a) a = b;}
bool within(int r, int c, int R, int C) { return 0 <= r && r < R && 0 <= c && c < C; }

void solve() {
    long long N, S;
    cin >> N >> S;

    vector<pair<int, int>> ts(N);
    rep(i,0,N) {
        int l, v, t;
        cin >> l >> v >> t;
        S -= l;
        ts[i] = make_pair(t, v);
    }

    sort(all(ts));
    for (int i = 0; i < N; i++) {
        ll ns = S;
        int ltime = i ? ts[i - 1].first : 0;
        for (int j = 0; j < N && ns > 0; j++) {
            ns -= (long long)min(ts[j].first, ltime) * ts[j].second;
        }
        ns = max(ns, 0LL);

        ll vv = 0;
        for (int j = i; j < N; j++) {
            vv += ts[j].second;
        }
        ll needtime = (ns + vv - 1) / vv;

        int dt = ts[i].first - ltime;
        if (needtime <= dt) {
            cout << ltime + needtime << endl;
            break;
        }
    }
}

int main() {
    cin.tie(0)->sync_with_stdio(0);
    cin.exceptions(cin.failbit);

    int TC = 1;
    if (!TC) cin >> TC;
    rep(i,1,TC+1) {
        // cout << i << " ";
        solve();
    }
}

