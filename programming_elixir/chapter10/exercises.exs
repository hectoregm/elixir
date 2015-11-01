defmodule MyList do
  def flatten([]), do: []
  def flatten([head | tail]) when is_list(head) do
    Enum.concat(flatten(head), flatten(tail))
  end
  def flatten([head | tail]) do
    [head | flatten(tail)]
  end
end
