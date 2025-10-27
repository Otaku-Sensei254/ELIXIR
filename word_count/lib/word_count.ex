defmodule Parser do
  @moduledoc """
    A helper function to parse user input data handling messy string inputs
  """
  @doc """
    This one verifies the string as a valid password (i.e:.. a number
    returning the integer if valid or 0 if invalid)
  """

  def verify_password(string) do
    try do
      # 1. We "use" the result by assigning it to _
      _ = String.to_integer(string)

      # 2. If line 1 succeeds, this line will run
      IO.puts("Good...... your password is verified")
    rescue
      # 3. If line 1 crashes, it jumps straight here
      ArgumentError ->
        IO.puts("This is not a number yow!!")
        0
    end
  end
end
