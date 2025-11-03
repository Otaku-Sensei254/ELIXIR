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


defmodule BankServer do
  use GenServer
  def start_link(_opts \\ []) do
    GenServer.start(__MODULE__, [], name: __MODULE__)
  end

  #===========ADD BANK================
  def add_bank(bank_details) when is_map(bank_details) do
    GenServer.cast(__MODULE__, {:add_bank, bank_details})
  end

  #===========REMOVE BANK================
  def remove_bank(acc_no) do
    GenServer.cast(__MODULE__, {:remove_bank, acc_no})
  end

  #===========CHANGE BANK STATE================
  def change_state(acc_no)  do
    GenServer.cast(__MODULE__, {:change_state, acc_no})
  end

  #==============LIST BANKS==================
    def get_banks() do
      GenServer.call(__MODULE__, :get_banks)
    end

    #=========SERVER ACTIVITIES

    @impl true
    def handle_cast({:add_bank, bank_details}, state) do
      id = length(state) + 1
      new_bank = Map.put(bank_details, :id, id)
      IO.puts("Just added #{inspect(new_bank)} to your list")
      {:noreply, [new_bank | state]}
    end

    #========GET BANKS==============
      @impl true
      def handle_call(:get_banks, _from, state) do
        {:reply, state, state}
      end

      #=========REMOVE BANK===============
        @impl true
        def handle_cast({:remove_bank, acc_no}, state) do
          new_bank_list = Enum.reject(state, fn bank -> bank.acc_no == acc_no  end)
          IO.puts("Removed the bank with account number #{acc_no} ")

          {:noreply, new_bank_list}
        end


        #CHANGE STATE TO FALSE
        @impl true
        def handle_cast({:change_state, acc_no}, state) do
          new_bank_state = Enum.map(state, fn bank ->
          if bank.acc_no == acc_no do
            updated = %{bank | active: !bank.active}
            IO.puts("Switched #{bank.name}'s #{bank.bank_name}: account number #{bank.acc_no} active: #{updated.active}")
            updated
          else
             bank
        end
          end)
          {:noreply, new_bank_state}
        end
        #=====INIT=======
    @impl true
  def init(_args) do
    {:ok, []}
  end
end
