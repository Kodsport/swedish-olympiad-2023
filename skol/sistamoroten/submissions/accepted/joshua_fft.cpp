// Slower than m2n on all testcases due to larger FFT constant factor, but can handle n=m=1000

#include <bits/stdc++.h>
using namespace std;

typedef long long ll;
const ll inf = 1e18;

#define rep(i, b) for(ll i = 0; i < (b); i++)
#define repp(i, a, b) for(ll i = a; i < (b); i++)
#define repe(i,arr) for (auto& i : arr)
#define all(x) begin(x), end(x)
#define sz(x) ((ll)(x).size())
typedef pair<ll, ll> p2;
typedef vector<ll> vi;
typedef vector<vi> vvi;

typedef complex<double> C;
typedef vector<double> vd;
void fft(vector<C>& a) {
	int n = sz(a), L = 31 - __builtin_clz(n);
	static vector<complex<long double>> R(2, 1);
	static vector<C> rt(2, 1);  // (^ 10% faster if double)
	for (static int k = 2; k < n; k *= 2) {
		R.resize(n); rt.resize(n);
		auto x = polar(1.0L, acos(-1.0L) / k);
		repp(i, k, 2 * k) rt[i] = R[i] = i & 1 ? R[i / 2] * x : R[i / 2];
	}
	vi rev(n);
	rep(i,n) rev[i] = (rev[i / 2] | (i & 1) << L) / 2;
	rep(i,n) if (i < rev[i]) swap(a[i], a[rev[i]]);
	for (int k = 1; k < n; k *= 2)
		for (int i = 0; i < n; i += 2 * k) rep(j,k) {
			// C z = rt[j+k] * a[i+j+k]; // (25% faster if hand-rolled)  /// include-line
			auto x = (double *)&rt[j+k], y = (double *)&a[i+j+k];        /// exclude-line
			C z(x[0]*y[0] - x[1]*y[1], x[0]*y[1] + x[1]*y[0]);           /// exclude-line
			a[i + j + k] = a[i + j] - z;
			a[i + j] += z;
		}
}
vd conv(const vd& a, const vd& b) {
	if (a.empty() || b.empty()) return {};
	vd res(sz(a) + sz(b) - 1);
	int L = 32 - __builtin_clz(sz(res)), n = 1 << L;
	vector<C> in(n), out(n);
	copy(all(a), begin(in));
	rep(i, sz(b)) in[i].imag(b[i]);
	fft(in);
	for (C& x : in) x *= x;
	rep(i, n) out[i] = in[-i & (n - 1)] - conj(in[i]);
	fft(out);
	rep(i, sz(res)) res[i] = imag(out[i]) / (4 * n);
	return res;
}

int main()
{
	cin.tie(0)->sync_with_stdio(0);

	int n,m,k;
	cin >> n >> m >> k;
	vector<double> res = { 1. };
	vector<double> mul(m);
	rep(i, m) mul[i] = 1. / m;

	while (n > 0)
	{
		if (n & 1) res = conv(res, mul);
		mul = conv(mul, mul);
		n >>= 1;
	}

	sort(res.rbegin(), res.rend());
	double ans = 0;
	rep(i, k) ans += res[i];
	cout << setprecision(15) << ans << endl;

	return 0;
}
