defmodule Exercise do
  def printable?(chars), do: Enum.all?(chars, fn ch -> ch in ?\s..?~ end)
end
