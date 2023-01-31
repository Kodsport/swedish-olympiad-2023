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
  int maxx = int(Arg("maxx"));
  int maxa = int(Arg("maxa"));
  int maxd = int(Arg("maxd"));
  Endl();
  rep(c1,0,n){
    int a = Int(0, maxx);
    Space();
    int d = Int(0, maxx);
    Endl();
  }

  int q = Int(1, Arg("maxq"));
  Endl();
  rep(c1,0,q){
    int A = Int(0, maxa);
    Space();
    int D = Int(0, maxd);
    Endl();
  }

}