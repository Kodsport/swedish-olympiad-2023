#include "validator.h"

bool is12(char c) {
    return c == '1' || c == '2';
}

void run() {
	int mxS = Arg("maxlen", 15);
    bool noconsec12 = Arg("noconsec12", false);
    string S = Line();
    assert(!S.empty() && (int)S.size() <= mxS);
    for (char c : S) assert(isdigit(c));

    if (noconsec12) {
        for (int i = 0; i < (int)S.size() - 2; i++) {
            assert(!is12(S[i]) || !is12(S[i + 1]) || !is12(S[i + 2]));
        }
    }
}
