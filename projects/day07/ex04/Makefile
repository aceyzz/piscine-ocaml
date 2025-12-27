NAME = alkane_combustion
SRCS = atom.ml molecule.ml alkane.ml reaction.ml alkane_combustion.ml main.ml

all: $(NAME)

$(NAME): $(SRCS)
	ocamlopt -o $(NAME) $(SRCS)

clean:
	rm -f *.cmx *.cmi *.o

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
