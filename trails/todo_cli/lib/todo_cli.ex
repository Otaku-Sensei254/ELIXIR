defmodule TodoCli do
  use Application

  def main(args) do
    TodoCli.CLI.main(args)
  end

  @impl true
  def start(_type, _args) do
    children = [
      TodoCli.List
    ]

    opts = [strategy: :one_for_one, name: TodoCli.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
