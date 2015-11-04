defmodule MyList do
  def flatten([]), do: []
  def flatten([head | tail]) when is_list(head) do
    Enum.concat(flatten(head), flatten(tail))
  end
  def flatten([head | tail]) do
    [head | flatten(tail)]
  end
  def span(from, to) when from > to, do: []
  def span(from, to), do: [from | span(from+1, to)]
  def primes(n), do: for x <- MyList.span(2,n), MyList.prime?(x), do: x
  def prime?(n), do: prime?(n, n - 1)
  defp prime?(_, 1), do: true
  defp prime?(n, d), do: rem(n,d) != 0 && prime?(n, d - 1)
end
IO.inspect MyList.primes(13)
