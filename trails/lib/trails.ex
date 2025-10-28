# =======================================TRAILS==========================
# =============Salutations================
defmodule Salutations do
  def ohayo(time, name) do
    "Hey, good #{time}😂, my name is #{name}"
  end
end

# =============arithmetics================
defmodule Math do
  def safe_divide(a, b) do
    a / b
  end

  def safe_divide(a, 0) do
    :error
  end
end

# =============string processing pipeline================
defmodule StringProc do
  def process(text) do
    text |> String.upcase() |> String.trim() |> String.reverse()
  end
end

# ===============List checker=======================
defmodule Listcheck do
  def describe([]) do
    :empty
  end

  def describe([item]) do
    {:one_item, item}
  end

  def describe([first_item | _tail]) do
    {:many_items, first_item}
  end
end

# ===================LVEL 2=========================
# working with lists ENUM is ur best friend
defmodule Transformer do
  def process(numbers) do
    numbers
    |> Enum.filter(fn n -> rem(n, 2) != 0 end)
    |> Enum.map(fn n -> n * n end)
  end
end

# list = [1, 9, 4, 6, 8] but you can use any word even ugali

# ===========================Databases===========================
# when dealing with key-value storage...make good use of Maps
# KEY THING IS:: IMNUTABILITY functions like Map.put() don't change the map, they
# return a new map with changes

defmodule Users do
  def get_user(data, id) do
    Map.get(data, id)
  end

  def update_user(data, id, new_name) do
    Map.put(data, id, new_name)
  end

  def get_username_or_guest(data, id) do
    Map.get(data, id, "guest")
  end
end

# ===============IMPROVED MATHS=================
# making a better division def using case
defmodule Maths do
  def division(a, b) do
    case b do
      0 ->
        {:error, "Cannot divide by Zero Puriss"}

      _ ->
        {:ok, a / b}
    end
  end
end

# =================Making my own recursion=========================

defmodule MyRecursor do
  def my_map([], _func) do
    []
  end

  def my_map([head | tail], func) do
    new_head = func.(head)
    # this takes the original my_map and puts it as the tail of the newly formed new_tail
    new_tail = my_map(tail, func)

    # builds a new list by putting the new_head at the front of the new formed new_tail
    [new_head | new_tail]
  end
end

#---------KEY-VALUE-STORE------------------------
defmodule KVStore do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, %{})
  end

  @impl true
  def init(empty_map) do
    #starts with empty MAP
    {:ok, empty_map}
  end
    def get(pid, key) do
      GenServer.call(pid, {:get, key})
    end

    @impl true
    def handle_call({:get, key}, _from, map_state) do
      value = Map.get(map_state, key)
      {:reply, value, map_state}
    end

    def put(pid, key, value) do
      GenServer.cast(pid, {:put, key, value })
    end
    @impl true
    def handle_cast({:put, key, value}, map_state) do
      new_map = Map.put(map_state, key, value)
      {:noreply, new_map}
    end

end


#===========================BANK ACCOUNT==================================
  defmodule Account do
    use GenServer
    def start_link(owner, initial_balance) do
      int_args = {owner, initial_balance}
      GenServer.start_link(__MODULE__, int_args)
    end

    @impl true
    def init({owner, initial_balance}) do
      state = %{balance: initial_balance,
                owner: owner
    }
      {:ok, state}
    end

    def deposit(pid, amount) do
      GenServer.cast(pid, {:deposit, amount})
    end

    def get_balance(pid) do
      GenServer.call(pid, :get_balance)
    end
    def withdraw(pid, amount) do
      GenServer.call(pid, {:withdraw, amount})
    end
    @impl true
    def handle_call(:get_balance, _from, state) do
      {:reply, state.balance, state}
    end
    @impl true
    def handle_call({:withdraw, amount}, _from, state) do
      current_balance = state.balance
      if amount > current_balance do
        {:reply, {:error, "Insufficient funds to make the withdraw"}, state}
      else
        new_balance = current_balance - amount
        new_state = Map.put(state, :balance, new_balance )
        {:reply, {:ok, new_balance}, new_state}
      end
    end

    @impl true
    def handle_cast({:deposit, amount}, state) do
      new_state = Map.update!(state, :balance, fn current_balance -> current_balance + amount end)
      {:noreply, new_state}
    end
  end
