#include <iostream>
#include <vector>
#include <string>
#include <map>
#include <unordered_map>
#include <set>
#include <unordered_set>
#include <limits.h>
#include <math.h>
#include <chrono>
#include <queue>
#include <stack>
#include <algorithm>
using namespace std;

#define rep(i,a,b) for (int i = a; i < b; i++)
#define pb push_back

typedef long long ll;
typedef vector<double> vd;
typedef vector<vector<double>> vvd;
typedef vector<int> vi;
typedef vector<vi> vvi;

int rows, cols, region_count, T;
vvd score;


struct UF {
    int n;
    vi p, r;
    vector<double> total_score;
    vi total_size;

    UF(int N) {
        n = N;
        p.resize(n); rep(i,0,n) p[i] = i;
        r.assign(n, 0);
        total_size.assign(n, 1);
        total_score.assign(n, 0.);
    }

    int P(int x) {return (x == p[x]) ? x : p[x] = P(p[x]);}

    void merge(int a, int b) {
        a = P(a); b = P(b);
        if (a == b) return;
        if (r[b] < r[a]) swap(a, b);
        p[a] = b;
        total_size[b] += total_size[a];
        total_score[b] += total_score[a];
        if (r[b] == r[a]) r[b]++;
    }

    bool merged(int a, int b) {
        return P(a) == P(b);
    }

    double get_average(int a) {
        a = P(a);
        return total_score[a] / (double) total_size[a];
    }
};

vector<pair<int,int>> nei(int r, int c) {
  vector<pair<int,int>> ret;
  if (r > 0) ret.pb({r - 1, c});
  if (r < rows - 1) ret.pb({r + 1, c});
  if (c > 0) ret.pb({r, c - 1});
  if (c < cols - 1) ret.pb({r, c + 1});
  return ret;
}

int index(int r, int c) {
    return r * rows + c;
}


void solve() {
    UF uf(rows * cols);
    rep(r,0,rows) rep(c,0,cols) uf.total_score[index(r, c)] = score[r][c];

    int merges = 0;
    while (merges < rows * cols - region_count) {
        int a = -1, b;
        double best_decrease = 1e9;

        rep(i,0,100) {
            int r = rand() % rows;
            int c = rand() % cols;
            for (auto [R, C] : nei(r, c)) {
                int x = index(r, c), y = index(R, C);
                if (uf.merged(x, y)) continue;
                double old_score = pow(abs(uf.get_average(x)),2.) + pow(abs(uf.get_average(y)),2.);
                double new_score = 2 * pow(abs((uf.get_average(x) + uf.get_average(y)) / 2),2.);
                double score_change = new_score - old_score;
                if (score_change < best_decrease) {
                    best_decrease = score_change;
                    a = x; b = y;
                }
            }
        }
        if (a == -1) continue;
        uf.merge(a, b);
        merges++;
    }

    set<int> parents;
    rep(r,0,rows) rep(c,0,cols) parents.insert(uf.P(index(r, c)));
    map<int,int> m;
    auto iter = parents.begin();
    rep(i,0,region_count) {
        m[*iter] = i;
        iter++;
    }

    vector<vector<int>> ans(rows, vector<int>(cols, 0));
    rep(r,0,rows) rep(c,0,cols) ans[r][c] = m[uf.P(index(r, c))];
    rep(r,0,rows) {
        rep(c,0,cols)  cout << ans[r][c] << " ";
        cout << endl;
    }
    double s = 0.;

    vector<bool> C(region_count, false);
    rep(r,0,rows) rep(c,0,cols) {
        int x = uf.P(index(r, c));
        if (C[m[x]]) continue;
        C[m[x]] = true;
        s += pow(uf.get_average(index(r, c)), 2.);
    }

    //cout << "Score: " << s << endl;
}

void input() {
    cin >> T >> rows >> cols >> region_count;
    srand(T);
    score.resize(rows); rep(i,0,rows) score[i].resize(cols);
    double average = 0.;
    rep(r,0,rows) rep(c,0,cols) {
        cin >> score[r][c];
        average += score[r][c];
    }
    average /= (double)(rows * cols);
    rep(r,0,rows) rep(c,0,cols) score[r][c] -= average;
}



int main() {
    input();
    if (cols > 200) exit(0);
    solve();
}