#include <bits/stdc++.h>
using namespace std;
 
#define rep(i, a, b) for(int i = a; i < (b); ++i)
#define trav(a, x) for(auto& a : x)
#define all(x) x.begin(), x.end()
#define sz(x) (int)(x).size()
typedef long long ll;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;
typedef vector<int> vi;
typedef vector<ll> vl;

int T,n;
vector<pii> houses;
 
int main() {
    ios_base::sync_with_stdio(0);
    cin.tie(0);
 
    cin >> T >> n;
    vi ind;
    rep(c1,0,n){
        int x,y;
        cin >> x >> y;
        houses.push_back({x, y});
        ind.push_back(c1);
    }

    random_shuffle(all(ind));
    rep(c1,0,n/2){
        cout << ind[c1]+1 << " ";
    }cout << "\n";
    

 
    return 0;
}