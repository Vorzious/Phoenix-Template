use Mix.Config

config :{{APP_NAME}}, ecto_repos: [{{MODULE_NAME}}.Repo]

import_config "#{Mix.env}.exs"
