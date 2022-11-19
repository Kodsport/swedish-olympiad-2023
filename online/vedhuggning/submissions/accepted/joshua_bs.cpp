// Should get 80
#include <bits/stdc++.h>
using namespace std;

typedef long long ll;

const int inf = int(2e9);
typedef vector<int> vi;
typedef vector<vi> vvi;
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

ll evaluate(vector<p3>& trees, ll time)
{
	ll height = 0;

	rep(i, trees.size()) height += get<0>(trees[i]) + get<1>(trees[i]) * min(time, (ll)get<2>(trees[i]));

	return height;
}

int32_t main()
{
	// Our function is basically gonna be a line with slope decreasing at a coupleo of points.
	// However, it is monotonically increasing => binary search
    // You could also find every point where the slope changes and solve it using math in the interval, but that would still be nlogn due to sorting (although radix sort exists)

	dread2(int, n, s);
	vector<p3> trees;
	rep(i, n)
	{
		dread3(int, l, v, t);
		trees.emplace_back(l, v, t);
	}


	ll lo = 0;
	ll hi = LLONG_MAX;

	while (true)
	{
		ll mid = (lo + hi) / 2;
		ll v = evaluate(trees, mid);
		if (v<s)
		{
			lo = mid;
		}
		else
		{
			hi = mid;
		}
		
		if (lo+1==hi)
		{
			cout << hi << endl;
			return 0;
		}
	}
}