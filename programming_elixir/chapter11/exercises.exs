defmodule Exercise do
  def printable?(chars), do: Enum.all?(chars, fn ch -> ch in ?\s..?~ end)
  def anagram?(word1, word2), do: Enum.sort(word1) == Enum.sort(word2)

  def calculate(str) do
    {num_a, [op | num_b]} = Enum.split_while(str, fn ch -> ch in '0123456789 ' end)
    number_a = parse_number(num_a)
    number_b = parse_number(num_b)
    eval([op], number_a, number_b)
  end

  defp parse_number(expression), do: _parse_number({ 0, expression })

  defp _parse_number({value, [ space | rest ] }) when space in ' ' do
    _parse_number({ value, rest })
  end
  
  defp _parse_number({value, [ digit | rest ] }) when digit in ?0..?9 do
    _parse_number({ value*10 + digit - ?0, rest})
  end

  defp _parse_number({result, [] }) do
    result
  end

  defp eval('+', a, b), do: a + b
  defp eval('-', a, b), do: a - b
  defp eval('*', a, b), do: a * b
  defp eval('/', a, b), do: div(a, b)
end
