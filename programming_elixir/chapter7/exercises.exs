defmodule MyList do
  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]
  def reduce([], value, _) do
    value
  end
  def reduce([head | tail], value, fun) do
    reduce(tail, fun.(head, value), fun)
  end
  def mapsum([], _), do: []
  #def mapsum(list, func), do: reduce(map(list, func), 0, &(&1 + &2))
  def mapsum(list, func), do: map(list, func) |> reduce(0, &(&1 + &2))
  def max([]), do: 0
  def max(list), do: reduce(list, 0, fn
    a, b -> Kernel.max(a, b)
  end)
  def caesar(list, n), do: map(list, fn
    el when el + n <= ?z -> el + n
    el -> el + n - 26
  end)

  def span(from, to) when from > to, do: []
  def span(from, to), do: [from | span(from+1, to)]
end
