sum = fn (a, b) -> a + b end
sum.(4, 5)

greet = fn -> IO.puts "Hello" end
greet.()

f1 = fn a, b -> a * b end
IO.puts f1.(4, 5)
