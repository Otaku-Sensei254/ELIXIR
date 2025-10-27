defmodule TrailsTest do
  use ExUnit.Case
  doctest Trails

  test "greets the world" do
    assert Trails.hello() == :world
  end
end
