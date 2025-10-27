defmodule Profile do
  defstruct [:bio, :location]
end

defmodule User do
  defstruct [:name, :age, :profile]
end

user = %User{
  name: "Dennis",
  age: 21,
  profile: %Profile{bio: "Short King of the Court", location: "Kenya"}
}

IO.inspect(user)
