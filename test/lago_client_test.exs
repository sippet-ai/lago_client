defmodule LagoClientTest do
  use ExUnit.Case
  doctest LagoClient

  test "greets the world" do
    assert LagoClient.hello() == :world
  end
end
