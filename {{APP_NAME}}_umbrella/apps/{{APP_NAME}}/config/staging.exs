use Mix.Config

# Database configuration
config :{{APP_NAME}}, {{MODULE_NAME}}.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("POSTGRES_USERNAME"),
  password: System.get_env("POSTGRES_PASSWORD"),
  database: System.get_env("POSTGRES_DATABASE"),
  hostname: System.get_env("POSTGRES_HOSTNAME"),
  pool_size: 15
