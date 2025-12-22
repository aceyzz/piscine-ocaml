let ft_test_sign number =
	if number >= 0 then
		print_endline "positive"
	else
		print_endline "negative"

(* main test *)
let () =
		Printf.printf "Test with [42]: ";
		ft_test_sign 42;
		Printf.printf "Test with [0]: ";
		ft_test_sign 0;
		Printf.printf "Test with [-42]: ";
		ft_test_sign (-42);
