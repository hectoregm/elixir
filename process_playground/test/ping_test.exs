defmodule Ping do
  def start do
    await
  end

  def await do
    receive do
      {:pong, pid} -> send(pid, {:ping, self})
    end

    await
  end
end

defmodule PingTest do
  use ExUnit.Case

  test "it responds to a pong with a ping" do
    ping = spawn_link(Ping, :start, [])
    Process.send ping, {:pong, self}, []
    assert_receive {:ping, ^ping}
  end

  test "it responds to two pongs with two pings" do
    ping = spawn_link(Ping, :start, [])
    Process.send ping, {:pong, self}, []
    assert_receive {:ping, ^ping}

    Process.send ping, {:pong, self}, []
    assert_receive {:ping, ^ping}
  end
end
