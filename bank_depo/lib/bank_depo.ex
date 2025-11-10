defmodule BankDepo.Deposit do
  import Ecto.Changeset
  alias BankDepo.Repo
  alias BankDepo.Account

  @doc """
  Creates a new account with zero balance

  ## Examples
      iex> {:ok, account} = BankDepo.Deposit.create_account()
      iex> account.current_balance
      Decimal.new("0.00")
  """
  def create_account do
    %Account{}
    |> Account.changeset(%{
      current_balance: Decimal.new(0),
      savings_balance: Decimal.new(0)
    })
    |> Repo.insert()
  end

  @doc """
  Deposits money into an account

  ## Examples
      iex> {:ok, account} = BankDepo.Deposit.create_account()
      iex> {:ok, updated} = BankDepo.Deposit.deposit(account.id, 100.0)
      iex> Decimal.to_float(updated.current_balance)
      100.0

      iex> {:error, reason} = BankDepo.Deposit.deposit(-1, 100.0)
      iex> reason
      "Account not found"
  """
  def deposit(account_id, amount) when is_number(amount) and amount > 0 do
    case Repo.get(Account, account_id) do
      nil ->
        {:error, "Account not found"}
      account ->
        new_balance = Decimal.add(account.current_balance, Decimal.new(amount))

        account
        |> change(%{current_balance: new_balance})
        |> Repo.update()
    end
  end

  def deposit(_, _), do: {:error, "Amount must be a positive number"}

  def withdraw(account_id, amount) when is_number(amount) and amount > 0 do
    case Repo.get(Account, account_id) do
      nil -> {:error, "Account not found"}
      account ->
        new_balance = Decimal.sub(account.current_balance, Decimal.new(amount))

        #check if they balance is enough to withdraw
        if Decimal.compare(new_balance, Decimal.new(0)) == :lt do
          {:error, "Insufficient balance"}
        else
          account
          |> change(%{current_balance: new_balance})
          |> Repo.update()
        end
    end
  end

  def withdraw(_, _), do: {:error, "Amount must be a positive number"}


  def get_acc(account_id) do
    Repo.get(Account, account_id)

  end

  def transfer_save(account_id, amount) when is_number(amount) and amount > 0 do
    case Repo.get(Account, account_id) do
      nil -> {:error, "Account not found"}
      account ->
        new_balance = Decimal.sub(account.current_balance, Decimal.new(amount))

        if Decimal.compare(new_balance, Decimal.new(0)) == :lt do
          {:error, "Insufficient balance"}
        else
          account
          |> change(%{current_balance: new_balance, savings_balance: Decimal.add(account.savings_balance, Decimal.new(amount))})
          |> Repo.update()
        end
    end
  end
  def get_all_acc do
    Repo.all(Account)

  end
end
