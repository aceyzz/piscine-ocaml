NAME = repeat_x
SRC  = repeat_x.ml

all: $(NAME)

$(NAME): $(SRC)
	ocamlopt -o $(NAME) $(SRC)

clean:
	rm -f *.cmx *.cmi *.o

fclean: clean
	rm -f $(NAME)

re: fclean all