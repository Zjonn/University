#include <stdio.h>
//3zad
#define SET(X,K)    (X | (1<<K)
#define ZERO(X,K)   (X & (1<<K))
#define NEG(X,K)    (X ^ (1<<K))
//4zad
#define Mult2y(X,Y) (X<<Y)
#define Mod2y(X,Y)  (X & (~(~0<<Y)))
#define Div2yL(X,Y) (X>>Y)
#define Div2yU(X,Y) ( X + (1 << Y)-1)>>Y)
//5zad
#define IsPow(X)(X & X-1)

int main(){
    printf("%d\n",Mod2y(6,2));
    printf("Is pow %u\n",IsPow(4));
    printf("Is pow %u\n",IsPow(0));
    printf("Is pow %u\n",IsPow(5));
    printf("Is pow %u\n",IsPow(1));
    printf("Is pow %u\n",IsPow(2));
    printf("Is pow %u\n",IsPow(3));
    printf("sub %u\n",-1);
}
//6zad
void littleToBig(unsigned int x){
    x = x>>16 | x<<16;
    x = ((x & 0xFF00FF00) >> 8) | ((x & 0x00FF00FF)<<8);
    //AABBCCDD
    //CCDDAABB
    //DDCCBBAA
}
//Kod sterujący - znak, który w kodowaniu znaków nie przenosi
//informacji, ale służy do sterowania urządzeniem

//0 NULL
//4 EOT (End of Transmission)
//7 BEL (Bell - sygnał dźwiękowy)
//10 LF (LineFeed - nowa linia)
//12 FF (Form Feed - nowa strona)
