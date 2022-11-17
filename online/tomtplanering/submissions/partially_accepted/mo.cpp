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

const ll inf = 1000000007;
const ll maxx = 1000000;

struct pt{
    int x,y;
};

pt p(int x, int y){
    pt res;
    res.x = x;
    res.y = y;
    return res;
}

ll dist(pt p1, pt p2){
    return abs(p1.x-p2.x) + abs(p1.y-p2.y);
}

int T,n;
vector<pt> houses;

bool compx(int i, int j){
    return houses[i].x < houses[j].x;
}

bool compy(int i, int j){
    return houses[i].y < houses[j].y;
}

vi solve_mo(){
    vi ind;
    rep(c1,0,n){
        ind.push_back(c1);
    }
    sort(all(ind), compy);
    vi res;
    rep(c1,0,n/2){
        res.push_back(ind[c1]);
    }
    sort(all(res), compx);

    ll blocks = ll(sqrt(n/3)+1);
    ll block_size = (n/2) / blocks;

    vector<vi> B(blocks+1, vi());
    rep(c1,0,n/2){
        int b = c1 / block_size;
        B[b].push_back(res[c1]);
    }
    res.clear();
    rep(b,0,blocks){
        sort(all(B[b]), compy);
        if(b%2 == 1)reverse(all(B[b]));
        trav(y, B[b]){
            res.push_back(y);
        }
    }
    return res;
}

 
int main() {
    ios_base::sync_with_stdio(0);
    cin.tie(0);
 
    cin >> T >> n;
    rep(c1,0,n){
        int x,y;
        cin >> x >> y;
        houses.push_back(p(x, y));
    }

    vi ans = solve_mo();

    rep(c1,0,n/2){
        cout << ans[c1]+1 << " ";
    }cout << "\n";

    return 0;
}