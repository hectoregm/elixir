defmodule Chop do
  def guess(actual, range = low..high) do
    guess = div(low+high, 2)
    IO.puts "Is it #{guess}"
    _guess(actual, guess, range)
  end

  defp _guess(actual, actual, _),
  do: IO.puts "Yes, It's #{actual}"

  defp _guess(actual, guess, _..high)
  when guess < actual,
  do: guess(actual, guess+1..high)

  defp _guess(actual, guess, low.._)
  when guess > actual,
  do: guess(actual, low..guess-1)
end

Chop.guess(273, 1..1000)
