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

const int TC = 5;

void run() {
  int n = Int(1, Arg("maxn"));
  Space();
  int t = Int(1, TC);
  assert(t == (int)Arg("t"));
  Endl();

  int maxx = Arg("maxx");
  if(t == 3)maxx = n+1;

  vector<int> x = SpacedInts(n, 1, maxx);
  rep(c1,0,n-1){
    assert(x[c1] < x[c1+1]);
  }

}