let rec ft_countdown number =
  if number <= 0 then
    begin
      print_int 0;
      print_char '\n'
    end
  else
    begin
      print_int number;
      print_char '\n';
      ft_countdown (number - 1)
    end

(* main test *)
let () =
  Printf.printf "Countdown from 3:\n";
  ft_countdown 3;
  Printf.printf "Countdown from 0:\n";
  ft_countdown 0;
  Printf.printf "Countdown from -1:\n";
  ft_countdown (-1);
