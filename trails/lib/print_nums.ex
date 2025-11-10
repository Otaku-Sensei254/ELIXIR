defmodule TodoApp do
  def start, do: loop([])

  defp loop(todos) do
    IO.puts("\n1. Add todo\n2. List todos\n3. Complete todo\n4. Exit")
    choice = IO.gets("Choose: ") |> String.trim()

    case choice do
      "1" -> add_todo(todos)
      "2" -> get_list(todos)
      "3" -> complete_do(todos)
      "4" -> :ok
      _ -> loop(todos)
    end
  end

  defp add_todo(todos) do
    title = IO.gets("New Task to DO :") |> String.trim()
    new_todos = todos ++ [%{title: title, done: false}]
    IO.puts("Just added #{title} to the todo list")
    loop(new_todos)
  end

  defp get_list(todos) do
    Enum.with_index(todos, 1) |>
    Enum.each( fn {%{title: t, done: d}, i} ->
    mark =  if d, do: "[ X ]", else: "[ ]"
    IO.puts("#{i}. #{mark} #{t}")
   end)
    loop(todos)
  end

  defp complete_do(todos) do
    idx = IO.gets(" Pick task to complete")
      |> String.trim()
     |> Integer.parse()
     |> case do
     {n, _n} -> n
     :error -> 0
    end

    new_todos = todos
    |> Enum.with_index(1)
    |> Enum.map(fn {todo, i} -> if i == idx, do: %{todo | done: true}, else: todo end)
    loop(new_todos)

  end
end
