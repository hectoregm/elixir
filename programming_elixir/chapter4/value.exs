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

# regular expressions
integers = ~r{[0-9]*}
Regex.run integers, "1234"

Regex.run ~r{[aeiou]}, "caterpillar"
