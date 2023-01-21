#include "validate.h"

#include <bits/stdc++.h>
using namespace std;

#define rep(i, a, b) for(int i = a; i < (b); ++i)
#define all(x) begin(x), end(x)
#define sz(x) (int)(x).size()
typedef long long ll;
typedef pair<int, int> pii;
typedef vector<int> vi;
typedef long double ld;

int main(int argc, char **argv) {
  init_io(argc, argv);

  int N;
  judge_in >> N;
  map<string, vector<string>> btoa;
  rep(i,0,N) {
    string a, b;
    judge_in >> a >> b;
    btoa[b].push_back(a);
  }
  
  map<string, set<string>> ok;
  for (auto s : btoa) {
  for (auto x : s.second)
    for (auto y : s.second) {
      ok[x].insert(y);
    }
  }


  int M;
  judge_in >> M;
  rep(i,0,M) {
    string judge;
    string team;
    judge_in >> judge;
    author_out >> team;
    if (!ok[judge].count(team)) wrong_answer("Invalid translation");
    if (ok[judge].size() > 1 && judge == team) wrong_answer("Didn't translate when possible");
  }

  string trailing;
  if(author_out >> trailing){
    wrong_answer("Trailing output");
  }

  accept();
}
