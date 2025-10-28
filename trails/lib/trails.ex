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
