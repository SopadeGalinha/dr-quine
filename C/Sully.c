#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

int main(void)
{
    int i = 5;
    char *s = "#include <stdio.h>%1$c#include <stdlib.h>%1$c#include <unistd.h>%1$c#include <fcntl.h>%1$c%1$cint main(void)%1$c{%1$c    int i = %2$d;%1$c    char *s = %3$c%4$s%3$c;%1$c    int fd;%1$c%1$c    if (i <= 0)%1$c        return (0);%1$c%1$c    if ((fd = open(%3$cSully_5.c%3$c, O_RDONLY)) != -1)%1$c    {%1$c        close(fd);%1$c        i--;%1$c    }%1$c%1$c    char filename[50];%1$c    sprintf(filename, %3$cSully_%%d.c%3$c, i);%1$c%1$c    if ((fd = open(filename, O_WRONLY | O_CREAT | O_TRUNC, 0644)) != -1)%1$c    {%1$c        dprintf(fd, s, 10, i, 34, s);%1$c        close(fd);%1$c    }%1$c%1$c    char cmd[100];%1$c    sprintf(cmd, %3$cclang -Wall -Wextra -Werror Sully_%%d.c -o Sully_%%d%3$c, i, i);%1$c    system(cmd);%1$c%1$c    sprintf(cmd, %3$c./Sully_%%d%3$c, i);%1$c    system(cmd);%1$c    return (0);%1$c}";
    int fd;

    if (i <= 0)
        return (0);

    if ((fd = open("Sully_5.c", O_RDONLY)) != -1)
    {
        close(fd);
        i--;
    }

    char filename[50];
    sprintf(filename, "Sully_%d.c", i);

    if ((fd = open(filename, O_WRONLY | O_CREAT | O_TRUNC, 0644)) != -1)
    {
        dprintf(fd, s, 10, i, 34, s);
        close(fd);
    }

    char cmd[100];
    sprintf(cmd, "clang -Wall -Wextra -Werror Sully_%d.c -o Sully_%d", i, i);
    system(cmd);

    sprintf(cmd, "./Sully_%d", i);
    system(cmd);
    return (0);
}