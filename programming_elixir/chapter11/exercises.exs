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

  def center(lst = [ _str | _rest ]) do
    lstring = Enum.max_by lst, fn str -> String.length str end
    len = String.length lstring
    _center(lst, len)
  end

  defp _center([], _) do
  end
  defp _center([ str | rest ], line_length) do
    str_length = String.length str
    padding = line_length - str_length
    lpadding = trunc Float.floor(padding / 2)
    IO.puts String.ljust(String.rjust(str, str_length + lpadding), str_length + padding)
    _center(rest, line_length)
  end

  def capitalize_sentences(str), do: _capitalize_sentences(str, "", "")

  defp _capitalize_sentences(<< 46 :: utf8, 32 :: utf8, tail :: binary >>, sentence, result) do
    _capitalize_sentences(tail, "", result <> String.capitalize(sentence <> ". "))
  end

  defp _capitalize_sentences(<< head :: utf8, tail :: binary >>, sentence, result) do
    _capitalize_sentences(tail, sentence <> << head :: utf8 >>, result)
  end

  defp _capitalize_sentences("", "", result) do
    result
  end

  defp _each(<< head :: utf8, tail :: binary >>, func) do
    func.(head)
    _each(tail, func)
  end

  defp _each(<<>>, _func), do: []
end
