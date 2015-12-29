defmodule Exercise1 do
  import :timer, only: [ sleep: 1 ]

  def sad_function do
    exit(:boom)
  end

  def run do
    spawn_link(Exercise1, :sad_function, [])
    receive do
      msg ->
        IO.puts "MESSAGE RECEIVED: #{inspect msg}"
    end
  end
end
