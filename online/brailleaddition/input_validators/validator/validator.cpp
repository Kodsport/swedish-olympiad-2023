#include "validator.h"

typedef long long ll;

void run() {
    string lline;
    int n = Int(1, 9);
    Endl();
    for(int i = 0; i < 2; i++){
        lline = Line();
        for(int j = 0; j < (int)lline.size(); j++){
            if((j+1)% 3 == 0){
                assert(lline[j]==' ');
            } else{
                assert((lline[j]=='.' || lline[j]=='*'));
            }
        }
    }
    lline = Line();
    for(auto el : lline){
        assert((el==' ' || el=='.'));
    }


    int m = Int(1, 9);
    Endl();
    for(int i = 0; i < 2; i++){
        lline = Line();
        for(int j = 0; j < (int)lline.size(); j++){
            if((j+1)% 3 == 0){
                assert(lline[j]==' ');
            } else{
                assert((lline[j]=='.' || lline[j]=='*'));
            }
        }
    }
    lline = Line();
    for(auto el : lline){
        assert((el==' ' || el=='.'));
    }
    
    Eof();
}
