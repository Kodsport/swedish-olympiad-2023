#include "validator.h"
#include <map>

void checkw(string s) {
  assert(1 <= s.size() && s.size() <= 20);
  for (char c : s) {
    assert('a'<= c && c <= 'z');
  }
}

void run() {
  map<string, vector<string>> atob;
  map<string, vector<string>> btoa;
  bool hassol = Arg("hassol", 0);

  set<pair<string, string>> D;

  int N = Int(1, 5000);
  Endl();
  for (int i = 0; i < N; i++) {
    string s = Line();
    size_t split = s.find(' ');
    assert(split != string::npos);
    string a = s.substr(0, split);
    checkw(a);
    string b = s.substr(split + 1);
    checkw(b);
    atob[a].push_back(b);
    btoa[b].push_back(a);
    D.emplace(a, b);
  }
  assert((int)D.size() == N);

  for (auto it : atob)
    for (auto it2 : btoa)
      assert(it.first != it2.first);

  if (hassol) {
    for (auto it : btoa)
      assert(it.second.size() >= 2);
  }

  int M = Int(1, 1000);
  Endl();
  string s = Line();
  s.push_back(' ');
  size_t at = 0;
  for (int i = 0; i < M; i++) {
    string w;
    while (s[at] != ' ') {
      w.push_back(s[at]);
      ++at;
      if (at == s.size()) {
        assert("missing word!");
      }
    }
    ++at;
    checkw(w);
    assert(atob.find(w) != atob.end());
  }
  assert(at == s.size());
}
