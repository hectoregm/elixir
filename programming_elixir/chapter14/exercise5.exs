defmodule Exercise5 do
  import :timer, only: [ sleep: 1 ]

  def sad_function(parent) do
    send parent, "BOOM!"
    raise "Boom Exception"
    #exit(:boom)
  end

  def receive_messages do
    receive do
      message ->
        IO.puts "Got #{inspect message}"
    after 500 ->
        IO.puts "It seems there's nothing more to do."
        exit :ok
    end
    receive_messages
  end

  def run do
    #Process.flag(:trap_exit, true)
    spawn_monitor(Exercise5, :sad_function, [self])
    sleep 500
    receive_messages
  end
end

Exercise5.run
