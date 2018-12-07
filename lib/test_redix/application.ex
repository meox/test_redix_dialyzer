defmodule TestRedix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      {Redix, host: "127.0.0.1", name: :redix}

      # Starts a worker by calling: TestRedix.Worker.start_link(arg)
      # {TestRedix.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TestRedix.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
