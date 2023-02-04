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

const int MAX_QUERIES = 20'000;

template<class T>
struct RMQ {
	vector<vector<T>> jmp;
	RMQ(const vector<T>& V) : jmp(1, V) {
		for (int pw = 1, k = 1; pw * 2 <= sz(V); pw *= 2, ++k) {
			jmp.emplace_back(sz(V) - pw * 2 + 1);
			rep(j,0,sz(jmp[k]))
				jmp[k][j] = min(jmp[k - 1][j], jmp[k - 1][j + pw]);
		}
	}
	T query(int a, int b) {
		assert(a < b); // or return inf if a == b
		int dep = 31 - __builtin_clz(b - a);
		return min(jmp[dep][a], jmp[dep][b - (1 << dep)]);
	}
};

struct LCA {
	int T = 0;
	vi time, depth, pars, path, ret;
	RMQ<int> rmq;

	LCA(vector<vi>& C) : time(sz(C)), depth(sz(C)), pars(sz(C)), rmq((dfs(C,0,-1,0), ret)) {}
	void dfs(vector<vi>& C, int v, int par, int dep) {
		time[v] = T++;
		depth[v] = dep;
		pars[v] = par;
		for (int y : C[v]) if (y != par) {
			path.push_back(v), ret.push_back(time[v]);
			dfs(C, y, v, dep+1);
		}
	}

	int lca(int a, int b) {
		if (a == b) return a;
		tie(a, b) = minmax(time[a], time[b]);
		return path[rmq.query(a, b)];
	}

	int dist(int a, int b) {
		return depth[a] + depth[b] - 2*depth[lca(a,b)];
	}
};

template<class F>
struct Jmp {
	vector<vector<pair<int, ll>>> jmp;
	LCA& lca;
	Jmp(const vector<vector<pair<int, ll>>>& eds, LCA& lca) : lca(lca) {
		int N = sz(lca.time);
		vector<pair<int, ll>> one(N);
		one[0] = {0, -1};
		rep(i,1,N) {
			trav(x, eds[i]) if (x.first == lca.pars[i]) {
				one[i] = x;
				goto found;
			}
			assert(0);
found:;
		}
		jmp.push_back(move(one));
		int dist = 2;
		while (dist <= N-1) {
			jmp.push_back({});
			auto& prev = jmp[sz(jmp)-2];
			auto& next = jmp[sz(jmp)-1];
			next.resize(N);
			rep(i,0,N) {
				int j = prev[i].first;
				next[i] = {
					prev[j].first,
					F()(prev[j].second, prev[i].second)
				};
			}
			dist *= 2;
		}
	}

	ll query(int a, int b) const {
		int c = lca.lca(a, b);
		return F()(query2(a, c), query2(b, c));
	}

	ll query2(int a, int up) const {
		int dist = lca.depth[a] - lca.depth[up];
		assert(dist >= 0);
		ll ret = F::ID;
		if (dist) rep(i,0,sz(jmp)) if (dist & 1 << i) {
			auto pa = jmp[i][a];
			ret = F()(ret, pa.second);
			a = pa.first;
		}
		assert(a == up);
		return ret;
	}
};

struct Add {
	constexpr static ll ID = 0;
	ll operator()(ll a, ll b) { return a + b; }
};
struct Max {
	constexpr static ll ID = LLONG_MIN;
	ll operator()(ll a, ll b) { return max(a, b); }
};

int main(int argc, char **argv) {
	init_io(argc, argv);

	int N;
	judge_in >> N;
	vector<vector<pair<int, ll>>> edsW(N), edsI(N);
	vector<vi> eds(N);
	set<pii> edSet;
	rep(i,0,N-1) {
		int a, b;
		ll w;
		judge_in >> a >> b >> w;
		edSet.insert({a, b});
		edSet.insert({b, a});
		eds[a].push_back(b);
		eds[b].push_back(a);
		// Edge i has weight w + eps * 2^i
		edsW[a].push_back({b, w});
		edsW[b].push_back({a, w});
		edsI[a].push_back({b, i});
		edsI[b].push_back({a, i});
	}
	assert(sz(edSet) == (N-1)*2);

	LCA lca(eds);
	Jmp<Add> distJmp(edsW, lca);
	Jmp<Max> indJmp(edsI, lca);

	auto closer = [&](int a, int b, int c) -> bool {
		assert(a != b);
		int ab = lca.lca(a, b);
		int abc = lca.lca(ab, c);
		int d;
		if (abc == ab) {
			// C is within the subtree of the (A, B) LCA. It will reach the path
			// between A and B at the deepest of the (A, C), (B, C) LCAs.
			int ac = lca.lca(a, c);
			int bc = lca.lca(b, c);
			d = lca.depth[ac] > lca.depth[bc] ? ac : bc;
		} else {
			// C is above the subtree of the (A, B) LCA. Its path to both A and B
			// will first go to the lca, and then split from there.
			d = ab;
		}
		ll da = distJmp.query(a, d);
		ll db = distJmp.query(b, d);
		if (da != db) return da < db;
		ll ia = indJmp.query(a, d);
		ll ib = indJmp.query(b, d);
		assert(ia != ib);
		return ia < ib;
	};

	cout << N << endl;

	char qtype;
	int qcount = 0;
	for (;;) {
		cin >> qtype;
		if (!cin) wrong_answer("EOF");
		if (qtype == '?') {
			int a, b, c;
			cin >> a >> b >> c;
			if (!cin) wrong_answer("EOF2");
			if (a < 1 || a > N || b < 1 || b > N || c < 1 || c > N) wrong_answer("out of bounds");
			if (a == b) wrong_answer("a = b is not allowed");
			++qcount;
			if (qcount > MAX_QUERIES) {
				wrong_answer("too many queries");
			}
			// if (a == c) wrong_answer("a = c is not allowed");
			// if (b == c) wrong_answer("b = c is not allowed");
			--a, --b, --c;
			if (closer(a, b, c)) cout << "A" << endl;
			else cout << "B" << endl;
		} else if (qtype == '!') {
			break;
		} else {
			wrong_answer("Invalid query type %c", qtype);
		}
	}

	rep(i,0,N-1) {
		int a, b;
		cin >> a >> b;
		if (!cin) wrong_answer("EOF3");
		if (a < 1 || a > N || b < 1 || b > N) wrong_answer("out of bounds");
		--a, --b;
		if (!edSet.count({a, b}))
			wrong_answer("guessed that edge %d - %d exists, but it does not", a, b);
		edSet.erase({a, b});
		edSet.erase({b, a});
	}
	assert(edSet.empty());

	string trailing;
	if (cin >> trailing){
		wrong_answer("Trailing output");
	}

	// TODO: score depending on qcount
	accept();
}
