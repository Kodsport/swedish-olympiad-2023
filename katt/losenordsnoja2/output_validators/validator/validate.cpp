#include "validate.h"

#include <bits/stdc++.h>
using namespace std;

#define rep(i, a, b) for(int i = a; i < (b); ++i)
#define trav(a, x) for (auto& a : x)
#define all(x) begin(x), end(x)
#define sz(x) (int)(x).size()
typedef long long ll;
typedef pair<int, int> pii;
typedef vector<int> vi;
typedef long double ld;

struct Tree {
    Tree *le, *ri;
    int L, R;
    int low, sum;

    Tree(const string& S, int L, int R): L(L), R(R) {
        if (R - L == 1) {
            low = sum = S[L] == ')' ? -1 : 1;
        } else {
            int M = L + (R - L) / 2;
            le = new Tree(S, L, M);
            ri = new Tree(S, M, R);
            sum = le->sum + ri->sum;
            low = min(le->low, le->sum + ri->low);
        }
    }

    pair<int, int> query(int lo, int hi) {
        if (hi <= L || lo >= R) return make_pair(0, 0);
        if (lo <= L && R <= hi) return make_pair(sum, low);

        pair<int, int> left = le->query(lo, hi);
        pair<int, int> right = ri->query(lo, hi);
        return make_pair(left.first + right.first, min(left.second, left.first + right.second));
    }

    bool ok(int l, int r) {
        pair<int, int> res = query(l, r);
        cerr << "res for [" << l << "," << r << ") = " << res.first << " " << res.second << endl;
        return res.first == 0 && res.second >= 0;
    }
};

int main(int argc, char **argv) {
	init_io(argc, argv);

	int N, Q;
	judge_in >> N >> Q;
    string S;
    judge_in >> S;

    Tree t(S, 0, N);

	cout << N << " " << Q << endl;

	char qtype;
	int qcount = 0;
	for (;;) {
		cin >> qtype;
		if (!cin) wrong_answer("EOF");
		if (qtype == '?') {
			int a, b;
			cin >> a >> b;
			if (!cin) wrong_answer("EOF2");
			if (a < 1 || a > N || b < 1 || b > N || a > b) wrong_answer("out of bounds");
			++qcount;
			if (qcount > Q) {
				wrong_answer("too many queries");
			}
			--a, --b;
            cout << t.ok(a, b + 1) << endl;
		} else if (qtype == '!') {
			break;
		} else {
			wrong_answer("Invalid query type %c", qtype);
		}
	}

    string S2;
    cin >> S2;
    if (!cin) wrong_answer("EOF3");
    if (S != S2) {
        wrong_answer("incorrect string");
    }

	string trailing;
	if (cin >> trailing){
		wrong_answer("Trailing output");
	}
	accept();
}
