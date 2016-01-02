defmodule Parallel2 do
  def pmap(collection, fun) do
    me = self
    collection
    |> Enum.map(fn (elem) ->
      spawn_link fn -> (send me, { self, fun.(elem) }) end
    end)
    |> Enum.map(fn (pid) ->
      receive do { _pid, result } -> result end
    end)
  end

  def busy(x) do
    Enum.map 1..10000, fn i -> :math.sin(i) end
    x
  end
end

IO.puts inspect Parallel2.pmap 1..10, &(Parallel2.busy(&1))
