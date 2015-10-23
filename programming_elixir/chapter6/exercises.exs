defmodule Sum do
  def upTo(0), do: 0
  def upTo(n), do: n + upTo(n-1)
end

defmodule GCD do
  def of(x,0), do: x
  def of(x,y), do: of(y,rem(x,y))
end
