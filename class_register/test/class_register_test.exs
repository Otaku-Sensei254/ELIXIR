defmodule ClassRegisterTest do
  use ExUnit.Case
  doctest ClassRegister

  test "greets the world" do
    assert ClassRegister.hello() == :world
  end
end
