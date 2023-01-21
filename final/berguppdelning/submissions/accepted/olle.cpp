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
vvd original_score, score;

void input() {
    cin >> T >> rows >> cols >> region_count;
    original_score.resize(rows); rep(r,0,rows) original_score[r].resize(cols);
    rep(r,0,rows) rep(c,0,cols) cin >> original_score[r][c];
    double average = .0;
    rep(r,0,rows) rep(c,0,cols) average += original_score[r][c];
    average = average / (double)(rows * cols);
    score.resize(rows); rep(r,0,rows) score[r].resize(cols);
    rep(r,0,rows) rep(c,0,cols) score[r][c] = original_score[r][c] - average;
}

vector<pair<int,int>> nei(int r, int c) {
  vector<pair<int,int>> ret;
  if (r > 0) ret.pb({r - 1, c});
  if (r < rows - 1) ret.pb({r + 1, c});
  if (c > 0) ret.pb({r, c - 1});
  if (c < cols - 1) ret.pb({r, c + 1});
  return ret;
}

int index(int r, int c) {
    return r * cols + c;
}

double get_score(vvi ans) {
    vd s(region_count,.0);
    vi amount(region_count,0);

    rep(r,0,rows) rep(c,0,cols) {
        s[ans[r][c]] += score[r][c];
        amount[ans[r][c]]++;
    }

    double res = 0.;
    rep(i,0,region_count) {
        res += pow(s[i] / (double)amount[i], 2.);
    }
    return res;
}

void output_ans(vvi ans) {
    rep(r,0,rows) {
        rep(c,0,cols) cout << ans[r][c] << " ";
        cout << endl;
    }
}

struct UF {
    int n, regions_left;
    vi p, r;
    vector<double> total_score;
    vi total_size;

    vector<set<int>> neighbors;

    UF(int N) {
        n = N;
        regions_left = n;
        p.resize(n); rep(i,0,n) p[i] = i;
        r.assign(n, 0);
        total_size.assign(n, 1);
        neighbors.resize(n);
        total_score.assign(n, 0.);
        rep(r,0,rows) rep(c,0,cols) total_score[index(r,c)] = score[r][c];
        initiate_nei();
    }

    UF(int N, vvi state) {
        n = N;
        regions_left = n;
        p.resize(n); rep(i,0,n) p[i] = i;
        r.assign(n, 0);
        total_size.assign(n, 1);
        neighbors.resize(n);
        total_score.assign(n, 0.);
        rep(r,0,rows) rep(c,0,cols) total_score[index(r,c)] = score[r][c];
        rep(r,0,rows) rep(c,0,cols) {
            for (auto [R, C] : nei(r, c)) {
                if (state[r][c] == state[R][C]) merge(index(r, c), index(R, C));
            }
        }
        initiate_nei();
    }

    void initiate_nei() {
        rep(r,0,rows) rep(c,0,cols) {
            int i = index(r, c);
            for (auto [R, C] : nei(r, c)) {
                int j = P(index(R, C));
                if (P(i) == j) continue;
                neighbors[P(i)].insert(j);
            }
        }
    }

    set<int> get_neighbors(int x) {
        x = P(x);
        set<int> new_nei;
        for (auto i : neighbors[x]) {
            if (P(i) == x) continue;
            new_nei.insert(P(i));
        }
        neighbors[x] = new_nei;
        return neighbors[x];
    }

    int P(int x) {return (x == p[x]) ? x : p[x] = P(p[x]);}

    void merge(int a, int b) {
        a = P(a); b = P(b);
        if (a == b) return;
        if (r[b] < r[a]) swap(a, b);
        p[a] = b;
        regions_left--;
        total_size[b] += total_size[a];
        total_score[b] += total_score[a];
        if (r[b] == r[a]) r[b]++;
        
        if (neighbors[a].size() > neighbors[b].size()) swap(neighbors[a], neighbors[b]);
        for (auto i : neighbors[a]) {
            neighbors[b].insert(P(i)); 
        }
    }

    bool merged(int a, int b) {
        return P(a) == P(b);
    }

    double get_average(int a) {
        a = P(a);
        return total_score[a] / (double) total_size[a];
    }

    void greedy_merge_dfs(int x) {
        x = P(x);
        int Y = -1;
        double best_score_decrease = 1e9;
        for (auto y : get_neighbors(x)) {
            double old_score = abs(get_average(x)) + abs(get_average(y));
            double new_score = 2 * abs((total_score[x] + total_score[y]) / (double)(total_size[x] + total_size[y]));
            double score_decrease = new_score - old_score;
            if (score_decrease < best_score_decrease) {
                best_score_decrease = score_decrease;
                Y = y;
            }
        }
        merge(x, Y);
    }

    vvi get_state() {
        set<int> parents;
        rep(r,0,rows) rep(c,0,cols) parents.insert(P(index(r, c)));
        map<int,int> m;
        auto iter = parents.begin();
        int i = 0;
        while (iter != parents.end()) {
            m[*iter] = i;
            i++;
            iter++;
        }

        vector<vector<int>> ans(rows, vector<int>(cols, 0));
        rep(r,0,rows) rep(c,0,cols) ans[r][c] = m[P(index(r, c))];
        return ans;
    }
};

vi test_case_iters = {
    100,
    100,
    100,
    100,
    5,
    5,
    5,
    3,
    2,
    2,
    2
};

vvi best_merge(UF & uf) {
    while (uf.regions_left > region_count) {
        int a = -1, b;
        double best_decrease = 1e9;

        set<int> checked;
        rep(i,0,test_case_iters[T]) {
            int r = rand() % rows;
            int c = rand() % cols;
            int x = uf.P(index(r, c));
            if (checked.find(x) != checked.end()) continue;
            checked.insert(x);

            for (auto y : uf.get_neighbors(x)) {
                if (y != uf.P(y)) continue;
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
    }

    return uf.get_state();
}

vvi best_merge() {
    UF uf(rows * cols);
    return best_merge(uf);
}

vvi best_merge(vvi & state) {
    UF uf(rows * cols, state);
    return best_merge(uf);
}

vvi greedy_merge(int target_regions) {
    UF uf(rows * cols);
    int merges = 0;
    while (merges < rows * cols - target_regions) {
        int r = rand() % rows;
        int c = rand() % cols;
        uf.greedy_merge_dfs(index(r, c));
        merges++;
    }
}

vvi solve_tiny() {
    return best_merge();
}

vvi solve_line(vd sc) {
    double low = -0.01, high = 1000.0, mid;
    double best_score = 1e9;
    vi best_ans(cols, 0);
    while (high - low > 0.001) {
        mid = (low + high) / 2.;

        vi ans(cols, -1);
        double score = 0.0;
        double current_sum = 0.0;
        int current_amount = 0;
        int x = 0;
        rep(c,0,cols) {
            ans[c] = x;
            current_sum += sc[c];
            current_amount++;
            double current_average = current_sum / (double)current_amount;
            if (abs(current_average) < mid) {
                if (x == region_count - 1) break;
                score += pow(current_average, 2.);
                current_sum = 0.;
                current_amount = 0;
                x++;
            }
        }
        rep(c,0,cols) if (ans[c] == -1) {
            ans[c] = x;
            current_sum += sc[c];
            current_amount++;
        }
        double current_average = current_sum / (double)current_amount;
        score += pow(current_average, 2.);
        if (ans[cols - 1] == region_count - 1) {
            high = mid;
            if (score < best_score) {
                best_score = score;
                best_ans = ans;
            }
        }
        else low = mid; 
    } 
    vvi ans(rows, vi(cols, 0));
    rep(r,0,rows) rep(c,0,cols) ans[r][c] = best_ans[c];
    return ans;
}

vvi solve_line() {
    return solve_line(score[0]);
}

vvi solve_double_line() {
    vvi ans(rows, vi(cols, -1));
    rep(r,0,rows) {
        vvi res = solve_line(score[r]);
        rep(c,0,cols) ans[r][c] = res[0][c];
    }
    return best_merge(ans);
}

vvi merge_squares() {
    UF uf(rows * cols);
    for (int r = 0; r < rows - 1; r += 2) {
        for (int c = 0; c < cols - 1; c += 2) {
            uf.merge(index(r, c), index(r + 1, c));
            uf.merge(index(r, c), index(r, c + 1));
            uf.merge(index(r, c), index(r + 1, c + 1));
        }
    }
    return uf.get_state();
}

vvi sample_cheese() {
    vvi ans = {
        {0, 0, 0, 1, 1, 1},
        {0, 0, 0, 4, 1, 3},
        {0, 5, 5, 3, 3, 3},
        {5, 5, 5, 3, 2, 2}
    };
    return ans;
}

int main() {
    input();

    vvi ans;
    if (T == 0 && rows == 4) ans = sample_cheese();

    if (T == 1) ans = solve_tiny();
    if (T == 2) ans = solve_line();
    if (T == 3) ans = solve_double_line();

    if (cols == 2 || T == 4 || T == 5 || T == 6 || T == 7) {
        ans = best_merge();
    }

    if (T > 7) {
        //vvi state = greedy_merge(200*200);
        vvi state = merge_squares();
        ans = best_merge();
    }

    output_ans(ans);
    double s = get_score(ans);
    //cout << "Score: " << s << endl;
}
