use Mix.Config

# Database configuration
config :{{APP_NAME}}, {{MODULE_NAME}}.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "{{APP_NAME}}_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
