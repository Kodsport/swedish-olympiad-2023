#include "validate.h"

#include <bits/stdc++.h>
using namespace std;

#define rep(i, a, b) for(int i = a; i < (b); ++i)
#define all(x) begin(x), end(x)
#define sz(x) (int)(x).size()
typedef long long ll;
typedef pair<int, int> pii;
typedef vector<int> vi;
typedef long double ld;

const int MAXX = 1000000000;

int main(int argc, char **argv) {
	init_io(argc, argv);

	int n, t, q;
  	judge_in >> n >> t;
  	vi X(n);
  	rep(c1,0,n){
    	judge_in >> X[c1]; 
  	}
  	q = n;
  	if(t == 4)q = n+1;

  	cout << n << " " << t << endl;

  	rep(c1,0,q+1){
    	char start;
    	if(!(cin >> start)){
			wrong_answer("Could not read first char of query %d", c1+1);
    	}
		if(start != '?' && start != '!'){
			wrong_answer("Query %d started with invalid char", c1+1);
		}
		if(start == '?'){
			int y;
			if(!(cin >> y)){
				wrong_answer("Got a ? query but could not read y, query %d", c1+1);
			}

			if(y < 1 || y > MAXX){
				wrong_answer("y out of range (%d)", y);
			}

			if(c1 == q){
				wrong_answer("Too many queries");
			}

			vi Y = X;
			Y.push_back(y);
			sort(all(Y));
			vi D;
			rep(c2,0,n){
				D.push_back(Y[c2+1]-Y[c2]);
			}
			sort(all(D));
			rep(c2,0,n-1){
				cout << D[c2] << " ";
			}
			cout << D[n-1] << endl;
		}
		if(start == '!'){
			vi X_ANS;
			rep(c2,0,n){
				int x;
				if(!(cin >> x)){
					wrong_answer("Could not read %d:th number when reading answer", c2+1);
				}
				X_ANS.push_back(x);
			}
			sort(all(X_ANS));
			rep(c2,0,n){
				if(X[c2] != X_ANS[c2]){
					int a = X_ANS[c2];
					int b = X[c2];
					wrong_answer("Number %d of answer was wrong (got %d wanted %d)", c2+1, a, b);
				}
			}
			break;
		}
  	}
	string trailing;
	if(cin >> trailing){
		wrong_answer("Trailing output");
	}

  	accept();
}
