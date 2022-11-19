#include "validator.h"

void run() {
    int N = Int(3, 15); Endl();
    for (int i = 0; i < N; i++) {
        Int(1, 100); Space();
        string stairs = _token(); Endl();
        for (char c : stairs) {
            assert('A' <= c && c <= 'Z');
        }
        assert(set<char>(stairs.begin(), stairs.end()).size() == stairs.size());
    }
}
