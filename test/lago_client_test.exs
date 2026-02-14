defmodule LagoClientTest do
  use ExUnit.Case
  doctest Lago

  test "raises when api key is missing" do
    assert_raise RuntimeError, "Missing Lago API key", fn ->
      Lago.new(api_key: nil)
    end
  end
end
