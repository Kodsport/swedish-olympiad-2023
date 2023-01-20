// usage: ./a.out input_file correct_output output_dir < contestants_output
#include <bits/stdc++.h>
using namespace std;

#define rep(i, from, to) for (int i = from; i < int(to); ++i)
#define sz(x) (int)(x).size()
#define all(x) (x).begin(), (x).end()
#define trav(a, x) for(auto& a : x)
typedef vector<int> vi;
typedef long long ll;
typedef pair<int, int> pii;

static string input_file, output_dir, answer_file;

int tc, r, c, n;
void die(const string& msg) {
    cerr << msg << endl;
    ofstream(output_dir + "/score.txt") << 0;
    exit(43);
}

void accept(long double score) {
    ofstream(output_dir + "/score.txt") << setprecision(2) << fixed << score;
    exit(42);
}

void judge_error(const string& msg) {
    cerr << msg << endl;
    exit(1);
}

template <class F>
void assert_done(istream& is, F fail) {
    try {
        string dummy;
        is >> dummy;
        if (is) fail("extraneous data: " + dummy);
    }
    catch (...) {}
}

template <class F>
double score(istream& is, const vector<vector<double>>& grid, int n, int r, int c, F fail) {

    double totalsc = 0;
    double globalavg = 0;
    rep(i, 0, r) rep(j, 0, c) globalavg += grid[i][j];
    globalavg /= r * c;

    // Read input
    vector<vector<int>> group(r, vector<int>(c));
    rep(i, 0, r)
    {
        rep(j, 0, c)
        {
            string in;
            try
            {
                is >> in;
                group[i][j] = stoi(in);
                if (group[i][j] < 0 || group[i][j] >= n) fail("Output was not within [0,n)");
            }
            catch (const std::exception&)
            {
                fail("Output was non-integer: " + in);
            }
        }
    }


    // group index maps to positions within group
    vector<set<pair<int, int>>> groupcoords(n);
    rep(i, 0, r) rep(j, 0, c) groupcoords[group[i][j]].insert(make_pair(i, j));

    rep(i, 0, n)
    {
        if (groupcoords[i].size() == 0) fail("Group " + to_string(i) + " didn't get any land");
    }

    vector<double> componentscore(n);
    vector<double> componentsize(n);

    vector<vector<bool>> visited(r, vector<bool>(c));
    vector<bool> groupsvisited(n);

    vector<pii> dirs = { {0,1},{0,-1},{1,0},{-1,0} };
    // Dubbelkolla!!
    rep(i, 0, r)
    {
        rep(j, 0, c)
        {
            int currgroup = group[i][j];
            // Om vi har besökt grupp k men en grabb i k inte är visited är den inte sammanhängande
            if (groupsvisited[currgroup] && !visited[i][j])
            {
                fail("Components not connected");
            }
            groupsvisited[currgroup] = 1;

            queue<pii> q;
            q.emplace(i, j);

            while (q.size())
            {
                pii p = q.front();
                q.pop();

                if (visited[p.first][p.second]) continue;
                visited[p.first][p.second] = 1;

                componentscore[currgroup] += grid[p.first][p.second];
                componentsize[currgroup]++;

                for (auto& dir : dirs)
                {
                    pii np = { p.first + dir.first,p.second + dir.second };
                    if (np.first < 0 || np.first >= r || np.second < 0 || np.second >= c) continue;
                    if (group[np.first][np.second] != currgroup) continue;
                    q.emplace(np);
                }
            }
        }
    }

    rep(i, 0, n)
    {
        totalsc += pow(componentscore[i] / componentsize[i] - globalavg, 2);
    }


    assert_done(is, fail);

    return totalsc;
}

int main(int argc, char** argv) {
    if (argc < 4) exit(1);
    cin.sync_with_stdio(0);
    cin.tie(0);

    input_file = argv[1];
    answer_file = argv[2];
    output_dir = argv[3];

    ifstream fin(input_file);
    fin.exceptions(cin.failbit | cin.badbit | cin.eofbit);

    int tc;
    fin >> tc;

    fin >> r >> c >> n;

    vector<vector<double>> grid(r, vector<double>(c));

    rep(i, 0, r) rep(j, 0, c)
    {
        fin >> grid[i][j];
    }

    assert_done(fin, die);
    fin.close();

    ifstream fans(answer_file);

    try {
        long double sc = score(cin, grid, n, r, c, die);
        long double bestsc = score(fans, grid, n, r, c, judge_error);
        //bestsc = double(n*m)/2.0;
        long double ratio = bestsc / sc;
        ratio = min(ratio, 1.0l);
        ofstream("../debug" + to_string(tc) + ".txt") << " " << tc << "contestant" << bestsc << " " << sc << " " << 10.0 * ratio;

        if (tc == 0) accept(0);
        else
        {
            if (sc == 0) accept(10);
            else accept(10.0 * ratio);
        }
    }
    catch (...) {
        die("IO failure");
    }
}