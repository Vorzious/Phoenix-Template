defmodule {{MODULE_NAME}}Endpoint.Mixfile do
  use Mix.Project

  def project do
    [
      app: :{{APP_NAME}}_endpoint,
      version: "0.0.1",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: (Mix.env == :prod || Mix.env == :staging),
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {{{MODULE_NAME}}Endpoint.Application, []},
      extra_applications: [
        :logger,
        :runtime_tools,
        :{{APP_NAME}},
        :{{APP_NAME}}_api, #YipYip-Scaffold-Remove-API
        :{{APP_NAME}}_cms, #YipYip-Scaffold-Remove-CMS
        :{{APP_NAME}}_web #YipYip-Scaffold-Remove-WEB
      ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.3.2"},
      {:phoenix_pubsub, "1.0.2"},
      {:phoenix_ecto, "3.3.0"},
      {:phoenix_html, "2.10.5"},
      {:phoenix_live_reload, "1.1.3", only: :dev},
      {:gettext, "0.14.1"},
      {:cowboy, "~> 1.0.0"},
      {:{{APP_NAME}}, in_umbrella: true},
      {:{{APP_NAME}}_api, in_umbrella: true}, #YipYip-Scaffold-Remove-API
      {:{{APP_NAME}}_cms, in_umbrella: true}, #YipYip-Scaffold-Remove-CMS
      {:{{APP_NAME}}_web, in_umbrella: true} #YipYip-Scaffold-Remove-WEB
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, we extend the test task to create and migrate the database.
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["test": ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
