#include <stdio.h>

int funcTest (int a){
    if (a < 0)
    {
        return 0;
    }
    
    if (a==1 || a==2)
    {
        return 1;
    }else
    {
        return funcTest(a-1) + funcTest(a-2);
    }
}

    
int main(void){
    int ss = funcTest(20);
    printf("result = %d\n",ss);
    printf("ddd");

}

