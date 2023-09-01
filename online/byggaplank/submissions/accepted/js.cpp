#include <bits/stdc++.h>
using namespace std;

#define rep(i, a, b) for(int i = a; i < (b); ++i)
#define all(x) begin(x), end(x)
#define sz(x) (int)(x).size()
typedef long long ll;
typedef pair<int, int> pii;
typedef vector<int> vi;

struct UF {
  vector<bool> active;
  vi uf;
  vi lo, hi;

  UF(int N) : active(N), uf(N, -1), lo(N), hi(N) {
    iota(all(lo), 0);
    iota(all(hi), 0);
  }

  int find(int x) {
    if (uf[x] < 0) return x;
    return uf[x] = find(uf[x]);
  }

  void join2(int l, int r) {
    l = find(l);
    r = find(r);
    assert(l != r);
    uf[r] = l;
    hi[l] = hi[r];
  }

  void join(int p, int h) {
    active[p] = true;
    if (p && active[p - 1]) join2(p - 1, p);
    if (p + 1 < size(uf) && active[p + 1]) join2(p, p + 1);
    // cerr << "p " << p << " " << find(p) << endl;
    // cerr << "seg " << lo[find(p)] << " " << hi[find(p)] << endl;
  }

};

int main() {
	cin.tie(0)->sync_with_stdio(0);
	cin.exceptions(cin.failbit);

  int N, K;
  cin >> N >> K;
  vi H(N);
  vector<pii> E(N);
  rep(i,0,N) {
    cin >> E[i].first;
    E[i].first = -E[i].first;
    E[i].second = i;
  }
  sort(all(E));

  ll ans = 0;
  UF uf(N);
  for (auto [mh, idx] : E) {
    uf.join(idx, -mh);

    rep(L,0,K+1) {
      int R = K - L;

      int l = uf.lo[uf.find(idx)];
      int r = uf.hi[uf.find(idx)];

      rep(i,0,L) {
        if (l) {
          --l;
          if (l && uf.active[l - 1]) l = uf.lo[uf.find(l - 1)];
        }
      }
      rep(i,0,R) {
        if (r + 1 != N) {
          ++r;
          if (r + 1 != N && uf.active[r + 1]) r = uf.hi[uf.find(r + 1)];
        }
      }

      // cerr << "idx " << idx << " h " << -mh << " is " << l << " " << r << endl;
      ans = max(ans, (r - l + 1) * ll(-mh));
    }
  }
  cout << ans << endl;
}
