defmodule TodoCli.CLI do
  def main(args) do
    case parse_args(args) do
      {_opts, ["add", task], _} ->
        TodoCli.List.add_task(task)
        IO.puts("Added task: \"#{task}\"")

      {_opts, ["ls"], _} ->
        tasks = TodoCli.List.tasks()
        IO.puts("To-do list:")
        tasks |> Enum.with_index(1) |> Enum.each(fn {task, index} ->
          IO.puts("#{index}. #{task}")
        end)

      _ ->
        IO.puts("Invalid command. Available commands: add <task>, ls")
    end
  end

  defp parse_args(args) do
    OptionParser.parse(args)
  end
end
