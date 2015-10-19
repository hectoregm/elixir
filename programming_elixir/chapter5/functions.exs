greet = fn -> IO.puts "Hello" end
greet.()

f1 = fn a, b -> a * b end
IO.puts f1.(4, 5)

swap = fn {a, b} -> {b, a} end
IO.inspect swap.({1, 2})

list_concat= fn a, b -> a ++ b end
IO.inspect list_concat.([1,2],[3,4])

sum = fn a, b, c -> a + b + c end
IO.inspect sum.(1,2,3)

pair_tuple_to_list = fn {a, b} -> [a, b] end
IO.inspect pair_tuple_to_list.({1234, 5678})

handle_open = fn
  {:ok, file} -> "Read data: #{IO.read(file, :line)}"
  {_,  error} -> "Error #{:file.format_error(error)}"
end


IO.inspect handle_open.(File.open("foo"))
IO.inspect handle_open.(File.open("functions.exs"))

fizzbuzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, a -> a
end

fb = fn n ->
  fizzbuzz.(rem(n,3), rem(n, 5), n)
end

IO.inspect fizzbuzz.(0, 0, 1)
IO.inspect [ fb.(10), fb.(11), fb.(12), fb.(13), fb.(14), fb.(15), fb.(16) ]
