NAME = watchtower
SRCS = watchtower.ml

all: $(NAME)

$(NAME): $(SRCS)
	ocamlopt -o $(NAME) $(SRCS)

clean:
	rm -f *.cmx *.cmi *.o

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
