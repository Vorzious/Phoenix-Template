defmodule {{MODULE_NAME}}.System.Healthcheck do
	alias {{MODULE_NAME}}.System.Healthcheck
	@enforce_keys [:application, :application_version]
	defstruct [
		env: Mix.env(),
		date_time: DateTime.utc_now(),
		project: :{{APP_NAME}},
		project_version: {{MODULE_NAME}}.Mixfile.project[:version],
		application: nil,
		application_version: nil,
		current_url: nil,
		host: nil
	]
end
