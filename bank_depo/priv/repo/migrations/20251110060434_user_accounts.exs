defmodule BankDepo.Repo.Migrations.UserAccounts do
  use Ecto.Migration

  def change do
      create table(:accounts) do
        add :current_balance, :decimal, precision: 10, scale: 2, default: 0.0
        add :savings_balance, :decimal, precision: 10, scale: 2, default: 0.0
        timestamps()
      end
  end
end
