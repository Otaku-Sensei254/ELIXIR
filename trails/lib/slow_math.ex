defmodule SlowMath do
  def double(number) do
    :timer.sleep(2000)
    number * 2
  end
end
