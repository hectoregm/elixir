# decimal
decimal = 1_000_000

# hexadecimal
hexadecimal = 0xcafe

# octal
octal = 0o765

# binary
binary = 0b1010

# floating-point numbers
fp = 314159.0e-5

IO.puts decimal
IO.puts hexadecimal
IO.puts octal
IO.puts binary
IO.puts fp

# Atoms
foo = :fred

IO.puts foo

# Ranges
range = 1..10
IO.inspect range

# regular expressions
integers = ~r{[0-9]*}
IO.inspect Regex.run integers, "1234"

IO.inspect Regex.split ~r{[aeiou]}, "caterpillar"

# PIDS
IO.inspect self

# Tuples
tuple_a = { 1, 2 }
IO.inspect tuple_a

# Lists
list_a = [1, 2, 3]
list_b = [4, 5, 6]
IO.inspect list_a ++ list_b
IO.inspect list_a -- [2, 4]
IO.inspect 1 in [1,2,3,4]

# Keyword lists ie list of two-value tuples
keyword_list = [name: "Dave", city: "Dallas", likes: "Programming"]
IO.inspect keyword_list

# Maps
states = %{ "AL"=> "Alabama", "WI" => "Wisconsin" }
IO.inspect states

responses = %{ {:error, :enoent} => :fatal, {:error, :busy} => :retry }
IO.inspect responses

# Shortcut when key is an atom
colors = %{ red: 0xff0000, green: 0x00ff00, blue: 0x0000ff }
IO.inspect colors

# Binaries
bin = << 1, 2 >>
IO.inspect bin

bin = <<3 :: size(2), 5 :: size(4), 1 :: size(2) >>
:io.format("~-8.2b~n", :binary.bin_to_list(bin))
IO.inspect byte_size bin

# Boolean operators: or, and, not first argument must be false or true

# Relaxed Boolean operators: ||, &&, !.
