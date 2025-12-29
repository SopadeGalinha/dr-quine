#include <stdio.h>

/*
    This program will print its own source when run.
*/
char *func(void) {
    char *s = "#include <stdio.h>%1$c%1$c/*%1$c    This program will print its own source when run.%1$c*/%1$cchar *func(void) {%1$c    char *s = %2$c%3$s%2$c;%1$c    return (s);%1$c}%1$c%1$cint main(void) {%1$c    /*%1$c        This program will print its own source when run.%1$c    */%1$c    char *s = func();%1$c    printf(s, 10, 34, s);%1$c    return (0);%1$c}%1$c";
    return (s);
}

int main(void) {
    /*
        This program will print its own source when run.
    */
    char *s = func();
    printf(s, 10, 34, s);
    return (0);
}
