defmodule BankApp.Bank do
  use Ecto.Schema
  import Ecto.Changeset

  schema "banks" do
    field :name, :string
    field :bank_name, :string
    field :acc_no, :integer
    field :active, :boolean, default: true

    timestamps()
  end

  def changeset(bank, attrs) do
    bank
    |> cast(attrs, [:name, :bank_name, :acc_no, :active])
    |> validate_required([:name, :bank_name, :acc_no])
    |> unique_constraint(:acc_no)
  end
end
