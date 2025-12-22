let ft_print_alphabet () =
  let rec alphabet_loop letter =
    if letter <= 'z' then 
      begin
        print_char letter;
        alphabet_loop (char_of_int (int_of_char letter + 1))
      end
  in
  alphabet_loop 'a';
  print_char '\n'

let () = ft_print_alphabet ()