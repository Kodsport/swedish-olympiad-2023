#include <bits/stdc++.h>
using namespace std;

#define rep(i, a, b) for(int i = a; i < (b); ++i)
#define all(x) begin(x), end(x)
#define sz(x) (int)(x).size()
#define trav(a, x) for (auto& a : x)
typedef long long ll;
typedef pair<int, int> pii;
typedef vector<int> vi;

struct Node {
	vi ch;
	pii path;
	int free;
	multiset<pii, greater<pii>> childPaths;
};

vector<Node> nodes;

void update(int at) {
	Node& n = nodes[at];
	auto it = n.childPaths.begin();
	n.path = {0, -1};
	if (it != n.childPaths.end()) {
		n.path = *it;
	}
	n.path.first += n.free;
}

void rec(int at, int par) {
	Node& n = nodes[at];
	if (par != -1) n.ch.erase(find(all(n.ch), par));
	trav(x, n.ch) {
		rec(x, at);
		n.childPaths.insert({nodes[x].path.first, x});
	}
	n.free = (par != -1);
	update(at);
}

void rec2(int at) {
	Node& n = nodes[at];
	auto it = n.childPaths.begin();
	if (it != n.childPaths.end()) {
		int x = it->second;
		n.childPaths.erase(it);
		rec2(x);
		n.childPaths.insert({nodes[x].path.first, x});
	}
	n.free = 0;
	update(at);
}

int main() {
	cin.tie(0)->sync_with_stdio(0);
	int N;
	cin >> N;
	nodes.resize(N);
	rep(i,0,N-1) {
		int a, b;
		cin >> a >> b;
		nodes[a].ch.push_back(b);
		nodes[b].ch.push_back(a);
	}
	rec(0, -1);
	int at = 0, it = 0;
	vi res(N-1);
	while (at < N-1) {
		int amt = nodes[0].path.first;
		it++;
		rep(i,at,at+amt)
			res[i] = it;
		at += amt;
		rec2(0);
	}
	rep(i,0,N-1) cout << res[i] << ' ';
	cout << endl;
}
