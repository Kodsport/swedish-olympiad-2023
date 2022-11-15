#include "validator.h"

void run() {
    int exaktK = Arg("K", -1);

	int N = Int(1, 1000); Space();
    int K = Int(1, N); Endl();

    if (exaktK != -1) assert(exaktK == K);

    string S = Line();
    assert((int)S.size() == N);
    for (char c : S) assert(c == 'V' || c == 'F');
}
