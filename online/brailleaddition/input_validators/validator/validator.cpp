#include "validator.h"

typedef long long ll;

vector<vector<string>> braille = {
    {
        ".*",
        "**",
        "..",
    },
    {
        "*.",
        "..",
        "..",
    },
    {
        "*.",
        "*.",
        "..",
    },
    {
        "**",
        "..",
        "..",
    },
    {
        "**",
        ".*",
        "..",
    },
    {
        "*.",
        ".*",
        "..",
    },
    {
        "**",
        "*.",
        "..",
    },
    {
        "**",
        "**",
        "..",
    },
    {
        "*.",
        "**",
        "..",
    },
    {
        ".*",
        "*.",
        "..",
    },
};

bool exists(vector<string> s) {
    return find(braille.begin(), braille.end(), s) != braille.end();
}

void readDigs(int N, bool only1) {
    vector<vector<string>> A(N, vector<string>(3));
    for (int i = 0; i < 3; i++) {
        string l = Line();
        assert(l.size() == 3 * N - 1);
        for (int j = 0; j < N; j++) {
            if (j) assert(l[3 * j - 1] == ' ');
            A[j][i].push_back(l[3 * j]);
            A[j][i].push_back(l[3 * j + 1]);
        }
    }
    assert(A[0] != braille[0] || N == 1);
    for (vector<string> dig : A) {
        if (only1) assert(dig == braille[1]);
        assert(exists(dig));
    }
}

void run() {
    bool only1 = Arg("only1", 0);
    int n = Int(1, 9); Endl();
    readDigs(n, only1);
    int m = Int(1, 9); Endl();
    readDigs(m, only1);
}
