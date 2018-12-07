defmodule TestRedixTest do
  use ExUnit.Case
  doctest TestRedix

  test "greets the world" do
    assert TestRedix.hello() == :world
  end
end
