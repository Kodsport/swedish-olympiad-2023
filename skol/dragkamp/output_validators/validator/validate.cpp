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

  int a, b, c, d;
  judge_in >> a >> b >> c >> d;

  int cnt = (a + b + c + d) / 2;
  int targ = (a + 2*b + 3*c + 4*d) / 2;

  int aa, bb, cc, dd;
  if (!(author_out >> aa)) wrong_answer("couldn't read a_1");
  if (!(author_out >> bb)) wrong_answer("couldn't read a_2");
  if (!(author_out >> cc)) wrong_answer("couldn't read a_3");
  if (!(author_out >> dd)) wrong_answer("couldn't read a_4");

  if (aa < 0 || aa > a) wrong_answer("a_1 out of bound");
  if (bb < 0 || bb > b) wrong_answer("a_2 out of bound");
  if (cc < 0 || cc > c) wrong_answer("a_3 out of bound");
  if (dd < 0 || dd > d) wrong_answer("a_4 out of bound");
  
  if (aa + bb + cc + dd != cnt) wrong_answer("team is not half of students");
  if (aa + 2*bb + 3*cc + 4*dd != targ) wrong_answer("team power is not half");

  string trailing;
  if(author_out >> trailing){
    wrong_answer("Trailing output");
  }

  accept();
}
