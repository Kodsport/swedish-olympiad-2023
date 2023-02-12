#include "validate.h"

#include <bits/stdc++.h>
using namespace std;

#define rep(i, a, b) for(int i = a; i < (b); ++i)
#define trav(a, x) for (auto& a : x)
typedef vector<int> vi;

int main(int argc, char **argv) {
	init_io(argc, argv);

	int N, F;
	judge_in >> N >> F;

	vector<vi> eds(N);
	rep(i,0,N-1) {
		int a, b;
		judge_in >> a >> b;
		--a, --b;
		eds[a].push_back(b);
		eds[b].push_back(a);
	}

	queue<int> q;
	vi dists(N, -1);
	vi fruits;
	rep(i,0,F) {
		int f;
		judge_in >> f;
		f--;
		fruits.push_back(f);
		dists[f] = 0;
		q.push(f);
	}

	while (!q.empty()) {
		int x = q.front();
		q.pop();
		trav(y, eds[x]) if (dists[y] == -1) {
			dists[y] = dists[x] + 1;
			q.push(y);
		}
	}

	rep(i,0,N) assert(0 <= dists[i] && dists[i] <= N-1);

	auto checkAns = [&](istream& is, feedback_function fail) -> int {
		int K;
		is >> K;
		if (!is) fail("eof1");
		if (K < 1 || K > N) fail("K is out of range: %d vs %d", K, N);
		vector<vi> addAtTime(N);
		rep(i,0,K) {
			int x;
			is >> x;
			if (!is) fail("eof2");
			if (x < 1 || x > N) fail("vertex number out of range: %d vs %d", x, N);
			--x;
			addAtTime[N-1 - dists[x]].push_back(x);
		}

		vi active, newActive;
		vi isActive(N);
		rep(t,0,N) {
			auto add = [&](int x) {
				if (!isActive[x]) {
					isActive[x] = 1;
					newActive.push_back(x);
				}
			};
			trav(x, active) {
				trav(y, eds[x]) add(y);
			}
			trav(x, addAtTime[t]) add(x);
			swap(active, newActive);
			newActive.clear();
		}

		trav(x, fruits) {
			if (!isActive[x])
				fail("Node %d is not covered", x+1);
		}

		string trailing;
		if (is >> trailing) {
			fail("Trailing output");
		}
		return K;
	};

	int judgeAns = checkAns(judge_ans, judge_error);
	int userAns = checkAns(cin, wrong_answer);

	if (userAns > judgeAns) {
		wrong_answer("K too high: %d vs %d", userAns, judgeAns);
	}
	if (userAns < judgeAns) {
		judge_error("K better than opt: %d vs %d", userAns, judgeAns);
	}

	accept();
}
