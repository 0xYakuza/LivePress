defmodule LivePress.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LivePressWeb.Telemetry,
      LivePress.Repo,
      {DNSCluster, query: Application.get_env(:livePress, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: LivePress.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: LivePress.Finch},
      # Start a worker by calling: LivePress.Worker.start_link(arg)
      # {LivePress.Worker, arg},
      # Start to serve requests, typically the last entry
      LivePressWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LivePress.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LivePressWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
