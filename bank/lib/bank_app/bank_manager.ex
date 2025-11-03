defmodule BankApp.BankManager do
  alias BankApp.{Repo, Bank}

  # Add a bank
  def add_bank(attrs) do
    %Bank{}
    |> Bank.changeset(attrs)
    |> Repo.insert()
  end

  # List all banks
  def get_banks do
    Repo.all(Bank)
  end

  # Remove a bank by account number
  def remove_bank(acc_no) do
    case Repo.get_by(Bank, acc_no: acc_no) do
      nil -> {:error, "Bank not found"}
      bank -> Repo.delete(bank)
    end
  end

  # Toggle active state by account number
  def change_state(acc_no) do
    case Repo.get_by(Bank, acc_no: acc_no) do
      nil -> {:error, "Bank not found"}
      bank ->
        bank
        |> Bank.changeset(%{active: !bank.active})
        |> Repo.update()
    end
  end
end
