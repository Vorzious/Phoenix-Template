# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :{{APP_NAME}}_endpoint,
  namespace: {{MODULE_NAME}}Endpoint,
  ecto_repos: [{{MODULE_NAME}}.Repo]

# Configures the endpoint
config :{{APP_NAME}}_endpoint, {{MODULE_NAME}}Endpoint.Endpoint,
  url: [host: "localhost"],
  secret_key_base: System.get_env("SECRET_KEY_BASE_ENDPOINT"),
  render_errors: [view: {{MODULE_NAME}}Endpoint.ErrorView, accepts: ~w(html json)],
  pubsub: [name: {{MODULE_NAME}}Endpoint.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :{{APP_NAME}}_endpoint, :generators,
  context_app: :{{APP_NAME}}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
