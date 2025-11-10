defmodule UiPhx.Repo do
  use Ecto.Repo,
    otp_app: :ui_phx,
    adapter: Ecto.Adapters.Postgres
end
