defmodule <%= app_module %>.MixProject do
  use Mix.Project

  def project do
    [
      app: :<%= app_name %>,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {<%= app_module %>.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug, "~> 1.10"},
      {:plug_cowboy, "~> 2.3"},
      {:poison, "~> 4.0"},
      {:earmark, "~> 1.4"},
      {:guardian, "~> 2.1"},
      {:cors_plug, "~> 2.0"},
      {:sse, "~> 0.4"},
      {:event_bus, "~> 1.6"}
    ]
  end
end
