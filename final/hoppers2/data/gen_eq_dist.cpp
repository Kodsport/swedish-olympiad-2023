// Credits for fractal code: Simon Lindholm. Everything else, Joshua is at fault for
#include <bits/stdc++.h>
using namespace std;

typedef pair<int, int> pii;
#define rep(i,lo,hi) for (int i = lo; i < hi; i++)

int minx, maxx, miny, maxy;
int leaves;

map<pii, char> grid;
set<pii> isleaf;
void mark(int x, int y, int dx, int dy, bool leaf) {
    if (x > 0) return;
    minx = min(minx, x);
    maxx = max(maxx, x);
    miny = min(miny, y);
    maxy = max(maxy, y);
    char ch = '#';
    if (dx == 0 && dy == 1) ch = '<';
    if (dx == 0 && dy == -1) ch = '>';
    if (dx == 1 && dy == 0) ch = '^';
    if (dx == -1 && dy == 0) ch = 'v';
    grid[pii(x, y)] = ch;
    if (leaf) isleaf.insert(pii(x, y));
}

void rec4(int x, int y, int n) {
    if (n == -1) return;
    if (n == 0) leaves += 4;
    int mx = 1 << n;
    rep(i, 1, mx + 1) {
        mark(x - i, y, -1, 0, n==0);
        mark(x + i, y, 1, 0, n == 0);
    }
    rep(i, 1, mx + 1) {
        mark(x - mx, y + i, 0, 1, n == 0);
        mark(x - mx, y - i, 0, -1, n == 0);
        mark(x + mx, y + i, 0, 1, n == 0);
        mark(x + mx, y - i, 0, -1, n == 0);
    }
    rec4(x - mx, y - mx, n - 1);
    rec4(x - mx, y + mx, n - 1);
    rec4(x + mx, y - mx, n - 1);
    rec4(x + mx, y + mx, n - 1);
}

int main(int argc, char* argv[]) {
    
    //int N = 3;// stoi(argv[1]);
    //rec4(0, 0, N);
    //double p_leaf = 1;// stod(argv[2]);
    //int noise = 1;//stoi(argv[3]);
    //int seed = 1;// stoi(argv[4]);
    
    int N = stoi(argv[1]);
    rec4(0, 0, N);
    double p_leaf = stod(argv[2]);
    int noise = stoi(argv[3]);
    int seed = stoi(argv[4]);

    vector<char> choices = { '<','>','v','^' };

    vector<vector<char>> board(maxx - minx, vector<char>(maxy - miny + 1, ' '));
    int i = 0;
    rep(x, minx, maxx) {
        int j = 0;
        rep(y, miny, maxy + 1)
        {
            if (grid[pii(x,y)])
            {
                char c = grid[pii(x, y)];
                board[i][j] = c;
            }
            else
            {
                char c = '-';
                c = choices[rand() % 4];
                if (x==minx) c = 'v';
                if (x==maxx-1) c = '^';
                if (y == miny) c = '>';
                if (y == maxy) c = '<';
                board[i][j] = c;
            }
            j++;
        }
        i++;
    }
    
    set<pii> seen;
    vector<pii> items;
    int n = 0;
    mt19937 rng(seed);
    uniform_real_distribution<double> dist(0, 1);
    for (auto& leaf : isleaf)
    {
        if (dist(rng) < p_leaf)
        {
            pii leaf2 = { leaf.first - minx, leaf.second - miny };
            items.emplace_back(leaf2);
            seen.insert(leaf2);
            n++;
        }
    }

    uniform_int_distribution<int> distx(0, maxx - minx - 1);
    uniform_int_distribution<int> disty(0, maxy - miny);
    rep(i, 0, noise)
    {
        while (true)
        {
            pii p = {distx(rng),disty(rng)};
            
            if (seen.find(p)==seen.end())
            {
                seen.insert(p);
                items.emplace_back(p);
                n++;
                break;
            }
        }
        
    }

    cout << (maxx - minx) << " " << (maxy - miny + 1) << " " << n << "\n";
    rep(i,0,int(board.size()))
    {
        rep(j,0,int(board[0].size()))
        {
            if (i==int(board.size())-1&&board[i][j]=='v') cout << '^';
            else cout << board[i][j];
        } 
        cout << "\n";
    }

    for (auto& item : items)
    {
        cout << item.first << " " << item.second << "\n";
    }

    //int area = (maxy - miny + 1) * (maxx - minx + 1);
    //cerr << leaves << '/' << area << ' ' << (double)leaves / area << endl;
}