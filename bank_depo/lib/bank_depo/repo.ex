defmodule BankDepo.Repo do
  use Ecto.Repo,
    otp_app: :bank_depo,
    adapter: Ecto.Adapters.Postgres
end
