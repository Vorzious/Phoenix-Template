# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :{{APP_NAME}}_cms,
  namespace: {{MODULE_NAME}}Cms,
  ecto_repos: [{{MODULE_NAME}}.Repo]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :{{APP_NAME}}_cms, :generators,
  context_app: :{{APP_NAME}}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
