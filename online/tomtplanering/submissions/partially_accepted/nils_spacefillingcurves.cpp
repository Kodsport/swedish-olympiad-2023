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

int CLOSE = 0;
bool closey(int i, int j){
    return abs(houses[i].y - CLOSE) < abs(houses[j].y - CLOSE);
}

int CLOSEX = 0;
int CLOSEY = 0;
bool closemax(int i, int j){
    int x1 = abs(houses[i].x - CLOSEX);
    int y1 = abs(houses[i].y - CLOSEY);
    int x2 = abs(houses[j].x - CLOSEX);
    int y2 = abs(houses[j].y - CLOSEY);
    return max(x1,y1) < max(x2,y2);
}


bool compmax(int i, int j){
    return max(houses[i].x, houses[i].y) < max(houses[j].x, houses[j].y);
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

void hillclimb(vi &P, bool small){
    int lim = 2000000;
    if(small){
        rep(c1,0,lim){
            try_to_swap(P, n+1);
        }
    }
    else{
        rep(c1,0,lim){
            int d = 100 - (99 * c1) / lim;
            try_to_swap(P, d);
        }
    }
    rep(c1,0,2*lim){
        try_to_swap(P, 5);
    }
    rep(c1,0,2*lim){
        try_to_swap(P, 2);
    }
}


vi solve1(int runs=1){
    vi ans;
    ll best = inf*inf;
    rep(run,0,runs){
        vi ind;
        rep(c1,0,n){
            ind.push_back(c1);
        }
        sort(all(ind), compx);
        ll mindist = inf;
        int start = 0;
        rep(c1,0,n/2+1){
            int i = ind[c1];
            int j = ind[c1+n/2-1];
            ll d = houses[j].x - houses[i].x;
            if(d < mindist ||(d == mindist && rand()%2 == 0)){
                mindist = d;
                start = c1;
            }
        }

        vi res;
        rep(c1,0,n/2){
            res.push_back(ind[start+c1]);
        }

        if(T == 2){
            rep(c1,0,1000000){
                try_to_swap(res, 8);
            }
            rep(c1,0,1000000){
                try_to_swap(res, 3);
            }
        }
        ll new_dist = score(res);
        if(new_dist < best){
            best = new_dist;
            ans = res;
        }
    }

    return ans;
}

vi solve_random(int runs, int hc){
    // Takes a random solution, and hillclimbs with 'try_to_swap'
    vi res;
    ll best_score = inf*inf;
    vi ind;
    rep(c1,0,n){
        ind.push_back(c1);
    }
    rep(_,0,runs){
        vi temp;
        random_shuffle(all(ind));
        rep(c1,0,n/2){
            temp.push_back(ind[c1]);
        }
        rep(c1,0,hc){
            try_to_swap(temp, n+1);
        }
        ll sc = score(temp);
        if(sc < best_score){
            best_score = sc;
            res = temp;
        }
    }
    return res;
}


vi solve_greedy(int runs, int hc, int choices=5){
    vi res;
    ll best_score = inf*inf;
    vi seen(n, -1);
    rep(run,0,runs){
        int start = rand()%n;
        seen[start] = run;
        vi temp;
        temp.push_back(start);
        rep(c1,0,n/2-1){
            vector<pii> other;
            int now = temp.back();
            rep(c2,0,n){
                if(seen[c2] != run){
                    other.push_back({dist(houses[now], houses[c2]), c2});
                }
            }
            sort(all(other));
            int nex = other[rand()%choices].second;
            seen[nex] = run;
            temp.push_back(nex);
        }
        rep(c1,0,hc){
            try_to_swap(temp, n+1);
        }
        ll new_score = score(temp);
        if(new_score < best_score){
            best_score = new_score;
            res = temp;
        }
    }
    return res;
}


vi solve_mo(bool small, int runs=1){
    vi ind;
    rep(c1,0,n){
        ind.push_back(c1);
    }

    vi ans;
    ll best = inf*inf;

    rep(run,0, runs){
        if(run == 0){
            sort(all(ind), compy);
        }
        else{
            CLOSE = rand()%maxx;
            sort(all(ind), closey);
        }
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
        rep(b,0,blocks+1){
            sort(all(B[b]), compy);
            if(b%2 == 1)reverse(all(B[b]));
            trav(y, B[b]){
                res.push_back(y);
            }
        }
        assert(sz(res) == n/2);
        if(small)hillclimb(res,small);
        ll new_score = score(res);
        if(new_score < best){
            best = new_score;
            ans = res;
        }
    }
    hillclimb(ans, small);

    return ans;
}

vi hilbert(vi &P, int start, int dir){

    int mx = inf;
    int MX = -inf;
    int my = inf;
    int MY = -inf;
    trav(i, P){
        mx = min(mx, houses[i].x);
        MX = max(MX, houses[i].x);
        my = min(my, houses[i].y);
        MY = max(MY, houses[i].y);
    }

    int midx = (mx+MX)/2;
    int midy = (my+MY)/2;
    if(sz(P) == 0)return {};
    if(MX-mx <= 3 && MY-my <= 3){
        vi res;
        trav(i, P){
            res.push_back(i);
        }
        return res;
    }
    vector<vi> V(4, vi());
    trav(i, P){
        if(houses[i].x <= midx && houses[i].y < midy)V[0].push_back(i);
        if(houses[i].x <= midx && houses[i].y >= midy)V[1].push_back(i);
        if(houses[i].x > midx && houses[i].y >= midy)V[2].push_back(i);
        if(houses[i].x > midx && houses[i].y < midy)V[3].push_back(i);
    }
    vi res;
    rep(c1,0,4){
        int i = (start + dir*c1 + 4)%4;
        int start2 = start;
        int dir2 = dir;
        if(c1 == 3)start2 = (start+2)%4;
        if(c1 == 0 || c1 == 3)dir2 = -dir;
        vi V2 = hilbert(V[i], start2, dir2);
        trav(y, V2){
            res.push_back(y);
        }
    }
    return res;
}

vi solve_hilbert(bool small, int runs=1){
    vi ind;
    rep(c1,0,n){
        ind.push_back(c1);
    }
    vi ans;
    ll best_score = inf*inf;
    rep(run,0,runs){
        if(run == 0){
            sort(all(ind), compmax);
        }
        else{
            CLOSEX = rand()%maxx;
            CLOSEY = rand()%maxx;
            sort(all(ind), closemax);
        }
        vi res;
        rep(c1,0,n/2){
            res.push_back(ind[c1]);
        }
        vi res2 = hilbert(res, 0, 1);
        hillclimb(res2,small);
        ll new_score = score(res2);
        if(new_score < best_score){
            best_score = new_score;
            ans = res2;
        }
    }


    return ans;
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

    vi ans;
    if(T == 1)ans = solve1();
    if(T == 2)ans = solve1(5);
    if(T == 3)ans = solve_random(10000, 1000);
    if(T == 4)ans = solve_mo(1);
    if(T == 5)ans = solve_mo(1);
    if(T == 6)ans = solve_hilbert(1);
    if(T == 7)ans = solve_mo(0);
    if(T == 8)ans = solve_mo(0);
    if(T == 9)ans = solve_mo(0);
    if(T == 10)ans = solve_mo(0);
    if(T == 0)ans = solve_random(1000, 1000);


    rep(c1,0,n/2){
        cout << ans[c1]+1 << " ";
    }cout << "\n";

    cerr << "TC " << T << ": " << score(ans) << "\n";

    return 0;
}