defmodule TodoList2 do

  defstruct [:id, :title, done: false]
  def new_tasks(), do: []

  def add_todo(todo, title) when is_list(todo) and is_binary(title) do
      id = length(todo) + 1
      task = %TodoList2{id: id, title: title, done: false}
      todo ++ [task]
  end

  def get_list(todo) when is_list(todo) do
   Enum.each(todo, fn task ->
    status = if task.done, do: "[✔] Done", else: "[X] Note yet"
    IO.puts("#{task.id}, #{task.title}, #{status}")

  end)

end
  def remove_task(todo, id) when is_list(todo) and is_integer(id) do
  Enum.reject(todo, fn task -> task.id == id end)
end
  def mark_done(todo, id) when is_list(todo) and is_integer(id) do
    Enum.map(todo, fn task ->
      if task.id == id do
        %{task | done: true}
      else
        task

      end
    end)
  end

end
