let rec ft_power number power =
  if power = 0 then 1
  else number * ft_power number (power - 1)

(* main test *)
let () = 
  Printf.printf "Test with [2, 4]: %d (must be 16)\n" (ft_power 2 4);
  Printf.printf "Test with [3, 0]: %d (must be 1)\n" (ft_power 3 0);
  Printf.printf "Test with [0, 5]: %d (must be 0)\n" (ft_power 0 5);
