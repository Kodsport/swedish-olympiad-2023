#include <bits/stdc++.h>

typedef long long ll;
const long long inf = 2e9;
using namespace std;

vector<int> parent, depth, heavy, head, pos,vec,w;
int cur_pos;

ll LOG=20;
struct SparseTable {
    ll n;
    vector<vector<ll>> p;
    SparseTable(vector<ll> & v){
        n=v.size();
        p.resize(LOG,vector<ll>(n));
        p[0]=v;
        for(int i=1; i<LOG; i++){
            for(int j=0; j<(n-(1<<i)+1); j++){
                p[i][j]=min(p[i-1][j],p[i-1][j+(1<<(i-1))]);
            }
        }
    }
    ll rmq(ll l, ll r){ // [l,r]
        ll diff=r-l+1;
        return min(p[log2(diff)][l],p[log2(diff)][r-(1<<(int)(log2(diff)))+1]);
    }

    ll nearestLeq(ll lo, ll x){
        ll l=lo,r=n-1;
        while(l<=r){
            ll mid=(l+r)/2;
            if(rmq(l,mid)<=x)r=mid-1;
            else l=mid+1;
        }
        return l;
    }
};
SparseTable sparseTable;
int dfs(int v, vector<vector<int>> const& adj) {
    int size = 1;
    int max_c_size = 0;
    for (int c : adj[v]) {
        if (c != parent[v]) {
            parent[c] = v, depth[c] = depth[v] + 1;
            int c_size = dfs(c, adj);
            size += c_size;
            if (c_size > max_c_size)
                max_c_size = c_size, heavy[v] = c;
        }
    }
    return size;
}

void decompose(int v, int h, vector<vector<int>> const& adj) {
    vec[cur_pos]=w[v];
    head[v] = h, pos[v] = cur_pos++;
    if (heavy[v] != -1)
        decompose(heavy[v], h, adj);
    for (int c : adj[v]) {
        if (c != parent[v] && c != heavy[v])
            decompose(c, c, adj);
    }
}

void init(vector<vector<int>> const& adj) {
    int n = adj.size();
    parent = vector<int>(n);
    depth = vector<int>(n);
    heavy = vector<int>(n, -1);
    head = vector<int>(n);
    pos = vector<int>(n);
    vec= vector<int>(n);
    cur_pos = 0;
    dfs(0, adj);
    decompose(0, 0, adj);
}

int query(int a, int b, int x) {
    int res = 0;
    for (; head[a] != head[b]; b = parent[head[b]]) {
        if (depth[head[a]] > depth[head[b]])
            swap(a, b);
        ll last=sparseTable.nearestLeq(pos[head[b]], x);
        while(last<=pos[b]){
            x%=vec[last];
            last=sparseTable.nearestLeq(last, x);
        }
    }
    if (depth[a] > depth[b])
        swap(a, b);
    ll last=sparseTable.nearestLeq(pos[a], x);
    while(last<=pos[b]){
        x%=vec[last];
        last=sparseTable.nearestLeq(last, x);
    }
    return x;
}

int main()
{
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    ll n,q;
    cin >> n>>q;
    ll root = 0;
    vector<vector<int>> g(n);
    for(int i=0;i<n-1;i++)
    {
        ll a, b;
        cin >> a >> b;
        a--, b--;
        g[a].push_back(b);
        g[b].push_back(a);
    }
    w.resize(n);
    for(auto &a:w)cin>>a;
    sparseTable= SparseTable(w);
    init(g);
    while(q--){
        ll a,b,x;
        cin>>a>>b>>x;
        a--,b--;
        cout<<query(a,b,x)<<'\n';
    }
    return 0;
}