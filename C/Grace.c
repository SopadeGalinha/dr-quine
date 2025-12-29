#include <stdio.h>

/* This program will print its own source when run */

#define FT "Grace_kid.c"
#define S "#include <stdio.h>%1$c%1$c/* This program will print its own source when run */%1$c%1$c#define FT %2$c%4$s%2$c%1$c#define S %2$c%3$s%2$c%1$c#define MAIN() int main() { FILE *f = fopen(FT, %2$cw%2$c); if (f) { fprintf(f, S, 10, 34, S, FT); fclose(f); } }%1$cMAIN()%1$c"
#define MAIN() int main() { FILE *f = fopen(FT, "w"); if (f) { fprintf(f, S, 10, 34, S, FT); fclose(f); } }
MAIN()
