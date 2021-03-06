defmodule WhatTheDay.Mixfile do
  use Mix.Project

  def project do
    [app: :what_the_day,
     version: "0.1.0",
     elixir: "~> 1.3",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {WhatTheDay, []},
     applications: [:phoenix, :phoenix_pubsub, :cowboy, :logger, :gettext,
                    :phoenix_ecto, :postgrex, :corsica, :timex]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "app", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web", "app"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.2"},
      {:phoenix_ecto, "~> 3.0"},
      {:postgrex, "~> 0.12"},
      {:gettext, "~> 0.11"},
      {:cowboy, "~> 1.0"},
      {:corsica, "~> 0.5"},
      {:timex, "~> 3.1"},
      {:dogma, "~> 0.1", only: :dev},
   ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     "db.sync": ["global_celebrations.sync_db", "countries.sync_db"],
     "test": ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
