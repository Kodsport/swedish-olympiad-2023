// Should get 80
#include <bits/stdc++.h>
using namespace std;

typedef long long ll;

const int inf = int(2e9);
typedef vector<int> vi;
typedef vector<vi> vvi;
typedef vector<vvi> vvvi;
typedef pair<int, int> p2;
typedef tuple<int, int, int> p3;

template <typename T> inline void read(T& a) { cin >> a; }
template <typename T> inline void read(T& a, T& b) { cin >> a >> b; }
template <typename T> inline void read(T& a, T& b, T& c) { cin >> a >> b >> c; }
#define dread(type, a) type a; read(a)
#define dread2(type, a, b) dread(type, a); dread(type, b)
#define dread3(type, a, b, c) dread2(type, a, b); dread(type, c)
#define readvector(type, name, size) vector<type> name(size); rep(i,size) {dread(type,temp); name[i]=temp;}

#define rep(i, high) for (int i = 0; i < high; i++)
#define repp(i, low, high) for (int i = low; i < high; i++)
#define repe(i, container) for (auto& i : container)
#define per(i, high) for (int i = high-1; i >= 0; i--)
#define perr(i, low, high) for (int i = high-1; i >= low; i--)

#define all(a) a.begin(),a.end()
#define rall(a) a.rbegin(),a.rend()
#define setcontains(set, x) (set.find(x) != set.end())


auto Start = chrono::high_resolution_clock::now();
void resettimer() { Start = chrono::high_resolution_clock::now(); }
int elapsedmillis() { return chrono::duration_cast<chrono::milliseconds>(chrono::high_resolution_clock::now() - Start).count(); }

int best(int i, int left, bool active, vi& won, vvvi& dp)
{
	if (i == won.size()) return 0;
	
	if (dp[i][left][active] != -1) return dp[i][left][active];

	int ret = 0;
	if (active)
	{
		ret = max(ret, won[i]+ best(i + 1, left, true, won, dp)); // keep going
		ret = max(ret, best(i + 1, left, false, won, dp)); // Stop going
	}
	if (!active)
	{
		if (left>0) ret = max(ret, won[i] + best(i + 1, left-1, true, won, dp)); // start
		ret = max(ret, best(i + 1, left, false, won, dp)); // dont start
	}
	
	
	return (dp[i][left][active] = ret);
}

int32_t main()
{
	// This problem is basically k largest subarrays
	// Similar to one of the problems Nils presented in last year's po-camp, also similar to https://po.kattis.com/problems/snokaos
	// May be solvable in nlogn using lagrangian relaxation (alien dp)?

	dread2(int, n, k);
	vi won(n);
	rep(i, n)
	{
		dread(char, r);
		won[i] = (r == 'V' ? 1 : -1);
	}

	vvvi dp(n, vvi(k + 1, vi(2,-1)));
	cout << best(0, k, false, won, dp);
}