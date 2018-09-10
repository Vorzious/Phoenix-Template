defmodule {{MODULE_NAME}}Api.ApiController do
  use {{MODULE_NAME}}Api, :controller

  def healthcheck(conn, _params) do
    json(conn, %{{MODULE_NAME}}.System.Healthcheck{
          application: :{{APP_NAME}}_api,
          application_version: {{MODULE_NAME}}Api.Mixfile.project[:version],
          current_url: current_path(conn),
          host: Plug.Conn.get_req_header(conn, "host")}
    )
  end
end
