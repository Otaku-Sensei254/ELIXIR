defmodule ClassRegister.Repo do
  use Ecto.Repo,
    otp_app: :class_register,
    adapter: Ecto.Adapters.Postgres
end
