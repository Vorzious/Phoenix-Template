defmodule {{MODULE_NAME}}.Application do
  @moduledoc """
  The {{MODULE_NAME}} Application Service.

  The {{APP_NAME}} system business domain lives in this application.

  Exposes API to clients such as the `{{MODULE_NAME}}Web` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor({{MODULE_NAME}}.Repo, []),
    ], strategy: :one_for_one, name: {{MODULE_NAME}}.Supervisor)
  end
end
