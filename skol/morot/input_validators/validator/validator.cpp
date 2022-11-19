#include "validator.h"

void run() {
    int maxtime = Arg("maxtime", 1000);
    Int(1, maxtime); Space();
    Int(1, maxtime); Endl();
}
