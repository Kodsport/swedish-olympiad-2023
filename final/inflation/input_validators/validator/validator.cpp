#include "validator.h"
#include <set>

#define rep(i, a, b) for(int i = a; i < (b); ++i)
#define all(x) begin(x), end(x)
#define sz(x) (int)(x).size()

const int N = 30;

double solve(double I, vector<double> A) {
  sort(A.begin(), A.end());
  double mx = 0;
  rep(i,0,N + 1) {
    double ni = I;
    rep(j,0,i) {
      ni += A[j];
    }
    rep(j,i,N) {
      ni += A[j] / 100 * ni;
    }
    if (ni > mx) mx = ni;
  }
  return mx;
}

double solveNoSort(double I, vector<double> A) {
  double mx = 0;
  rep(i,0,N + 1) {
    double ni = I;
    rep(j,0,i) {
      ni += A[j];
    }
    rep(j,i,N) {
      ni += A[j] / 100 * ni;
    }
    if (ni > mx) mx = ni;
  }
  return mx;
}

double solvePct(double I, vector<double> A) {
  sort(A.begin(), A.end());
  double mx = 0;
  rep(i,0,N + 1) {
    double ni = I;
    rep(j,0,i) {
      ni += A[j];
    }
    rep(j,i,N) {
      ni += A[j] / 100 * ni;
    }
    if (ni > mx) mx = ni;
  }
  return mx;
}

void run() {
  bool isPct = Arg("pct", 0);
  bool isOrd = Arg("ord", 0);

  double I = Float(0, 1000, 2); Endl();
	vector<double> A = SpacedFloats(30, 0, 1000, 2);
  double s = solve(I, A);
  double pct = solvePct(I, A);
  double nosort = solveNoSort(I, A);
  cerr << pct << " " << s << " " << (pct == s) << " " << (pct - s) << endl;
  cerr << nosort << " " << s << " " << (nosort == s) << " " << (nosort - s) << endl;
  if (isPct) assert(solvePct(I, A) == solve(I, A));
  if (isOrd) assert(solveNoSort(I, A) == solve(I, A));
}
