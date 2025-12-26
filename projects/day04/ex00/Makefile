NAME = micronap
SRCS = micronap.ml

all: $(NAME)

$(NAME): $(SRCS)
	ocamlopt -o $(NAME) -I +unix unix.cmxa $(SRCS)

clean:
	rm -f *.cmx *.cmi *.o

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
