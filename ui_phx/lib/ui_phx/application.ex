defmodule UiPhx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      UiPhxWeb.Telemetry,
      UiPhx.Repo,
      {DNSCluster, query: Application.get_env(:ui_phx, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: UiPhx.PubSub},
      # Start a worker by calling: UiPhx.Worker.start_link(arg)
      # {UiPhx.Worker, arg},
      # Start to serve requests, typically the last entry
      UiPhxWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: UiPhx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    UiPhxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
