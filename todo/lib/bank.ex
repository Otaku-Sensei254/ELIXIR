defmodule Bank do

    defstruct [:id, :name, :acc_no, :bank_name, active: true]

  def new_banks(), do: []

  def add_bank(banks, name, acc_no, bank_name) when is_list(banks) and is_binary(name) and is_binary(bank_name) and is_integer(acc_no)do
    id = length(banks) + 1
    bank = %Bank{id: id, name: name, acc_no: acc_no, bank_name: bank_name, active: true}
    banks ++ [bank]
  end

        #============GET BANKS================
    def get_banks(banks) do
      Enum.map(banks, fn bank ->
         state = if bank.active, do: "Active", else: "Inactive"
        IO.puts("#{bank.id} #{bank.name} - #{state}")
        end)
        banks
    end

    #================REMOVE BANKS==============

    def remove_bank(banks, id) when is_list(banks) and is_integer(id) do
      new_bank_list = Enum.reject(banks, fn bank ->  if bank.id == id do
        IO.puts("Removed #{inspect(bank.bank_name)}")
      end

    end)
    IO.puts("Removed #{id} from List")
      new_bank_list
    end

    #=================CHANGE STATE============
      def change_state(banks, id) when is_list(banks) and is_integer(id)do
        new_bank_list = Enum.map(banks, fn  bank ->
        if bank.id == id do
          %{bank | active: !bank.active}
        else
          bank
        end
     end)
     new_bank_list
      end
end
