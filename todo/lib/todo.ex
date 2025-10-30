defmodule TodoList do
  defmodule Task do
    defstruct [:id, :title, completed: false]
  end

  #Now we create an empty to-do list
  def new(), do: []

  #now we add a task to our list
  def add_task(tasks, title) when is_list(tasks) and is_binary(title) do
    id = next_id(tasks)
    task = %Task{id: id, title: String.trim(title)}
    [task | tasks]
  end

  #now we get the todoList
  def list_tasks(tasks) when is_list(tasks) do
      if tasks == [] do
        IO.puts("No tasks added yet")
      else
        tasks
        |> Enum.reverse()
        |> Enum.each(fn %Task{id: id, title: title, completed: done} ->
          status = if done, do: "[X]", else: "[ ]"
          IO.puts("#{id}. #{status} #{title}")
        end)

      end
      tasks
  end

  #marked as done
  def mark_done(tasks, id) when is_list(tasks) and is_integer(id) do
    Enum.map(tasks, fn
      %Task{id: ^id} = task -> %{task | completed: true}
    task -> tasks
   end)
  end

  #Helper function....

  defp next_id([]), do: 1
  defp next_id(tasks) do
    tasks
    |> Enum.map(& &1.id)
    |> Enum.max()
    |> Kernel.+(1)
  end

end
