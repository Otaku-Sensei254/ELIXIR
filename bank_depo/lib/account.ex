defmodule BankDepo.Account do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts" do
    field :current_balance, :decimal, default: 0.0
    field :savings_balance, :decimal, default: 0.0
    timestamps()

    def changeset(account, attrs) do
      account
      |>cast(attrs, [:current_balance, :savings_balance])
      |>validate_required([:current_balance, :savings_balance])
      |>validate_number(:current_balance, greater_than_or_equal_to: 0)
      |>validate_number(:savings_balance, greater_than_or_equal_to: 0)
    end

  end
end
