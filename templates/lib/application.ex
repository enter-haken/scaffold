defmodule <%= app_module %>.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: <%= app_module %>.Web.Router, options: [port: 4040, compress: true]},
    ]

    opts = [strategy: :one_for_one, name: Sup<%= app_module %>.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
