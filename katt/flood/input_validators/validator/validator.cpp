#include "validator.h"

#include <bits/stdc++.h>
using namespace std;

#define rep(i, a, b) for(int i = a; i < (b); ++i)
#define trav(i, a) for(auto& i : a)
#define all(x) begin(x), end(x)
#define sz(x) (int)(x).size()
typedef long long ll;
typedef pair<int, int> pii;
typedef vector<int> vi;

void run() {
  ll R = Int(1LL, Arg("maxr", 200'000LL)); Space();
  ll C = Int(1LL, Arg("maxc", 200'000LL)); Endl();
  assert(R * C <= (long long)Arg("maxrc", 200'000LL));

  int maxx = Arg("maxx", 99999);
  rep(i,0,R) {
      SpacedInts(C, 0, maxx);
  }
  int Q = Int(1, Arg("maxq", 100'000)); Endl();
  rep(i,0,Q) {
      Int(1, R); Space();
      Int(1, C); Space();
      Int(0, maxx); Endl();
  };
}
