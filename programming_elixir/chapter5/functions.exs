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

# Closures
greeter = fn name -> (fn -> "Hello #{name}" end) end
hector_greeter = greeter.("Hector")
IO.inspect hector_greeter.()

prefix = fn prefix_string ->
  fn string ->
    "#{prefix_string} #{string}"
  end
end

coolcat_prefix = prefix.("coolcat")
IO.inspect coolcat_prefix.("Hello")

list = [1, 3, 5, 7, 9]
IO.inspect Enum.map list, fn elem -> elem * 2 end

add_one = &(&1 + 1) # same as add_one = fn (n) -> n + 1 end
IO.inspect add_one.(9)

divrem = &{ div(&1,&2), rem(&1,&2) }
IO.inspect divrem.(13,5)

IO.inspect Enum.map [1,2,3,4], &(&1 + 1)

IO.inspect Enum.map [1,2,3,4], &(&1 + 2)
IO.inspect Enum.each [1,2,3,4], &(IO.inspect &1)

