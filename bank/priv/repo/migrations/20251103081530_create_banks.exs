defmodule BankApp.Repo.Migrations.CreateBanks do
  use Ecto.Migration

  def change do
    create table(:banks) do
      add :name, :string, null: false
      add :acc_no, :bigint, null: false
      add :bank_name, :string, null: false
      add :active, :boolean, default: true, null: false
      timestamps()
    end

    create unique_index(:banks, [:acc_no])
  end
end
