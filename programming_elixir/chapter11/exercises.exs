defmodule Exercise do
  def printable?(chars), do: Enum.all?(chars, fn ch -> ch in ?\s..?~ end)
  def anagram?(word1, word2), do: Enum.sort(word1) == Enum.sort(word2)
end
