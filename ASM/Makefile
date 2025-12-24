NAME = Colleen

all: $(NAME)

$(NAME): Colleen.o
	clang -no-pie -Wall -Wextra -Werror Colleen.o -o Colleen

Colleen.o: Colleen.s
	nasm -f elf64 Colleen.s -o Colleen.o

clean:
	rm -f Colleen.o

fclean: clean
	rm -f Colleen

re: fclean all