defmodule Trails.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Trails.Worker.start_link(arg)
      # {Trails.Worker, arg}
      #tells supervisor to start the KVStore and name it  :kv_store
    {KVStore, name: :kv_store},
    {Hotel, name: :hotel},
    {Settings, name: :settings},

      #Account,
      #Cart,

      {MovieStore, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Trails.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
