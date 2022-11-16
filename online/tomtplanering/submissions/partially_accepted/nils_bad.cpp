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

ll score(vi &P){
    ll res = 0;
    rep(c1,1,sz(P)){
        res += dist(houses[P[c1]], houses[P[c1-1]]);
    }
    return res;
}

ll around(int i, vi &P){
    ll res = 0;
    if(i > 0)res += dist(houses[P[i]], houses[P[i-1]]);
    if(i < n/2-1)res += dist(houses[P[i]], houses[P[i+1]]);
    return res;
}

void try_to_swap(vi &P, int d){
    int i = rand()%(n/2);
    int j = i + rand()%d + 1;
    if(d > n)j = rand()%(n/2);
    j = min(j, n/2-1);

    ll old_score = around(i, P) + around(j, P);
    swap(P[i], P[j]);
    ll new_score = around(i, P) + around(j, P);
    if(new_score >= old_score)swap(P[i], P[j]);
}


vi solve_swap(){
    vi ind;
    rep(c1,0,n){
        ind.push_back(c1);
    }
    sort(all(ind), compx);
    vi res;
    rep(c1,0,n/2){
        res.push_back(ind[c1]);
    }
    sort(all(res), compy);
    rep(c1,0,1000000){
     //   try_to_swap(res, n+1);
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

    vi ans = solve_swap();

    rep(c1,0,n/2){
        cout << ans[c1]+1 << " ";
    }cout << "\n";

    cerr << "TC " << T << ": " << score(ans) << "\n";



 
    return 0;
}