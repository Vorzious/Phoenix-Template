defmodule {{MODULE_NAME}}Cms.PageController do
  use {{MODULE_NAME}}Cms, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def login(conn, _params) do
    render conn, "login.html", layout: {{{MODULE_NAME}}Cms.LayoutView, "login.html"}
  end
  
  def forgot_pass(conn, _params) do
    render conn, "forgot_pass.html", layout: {{{MODULE_NAME}}Cms.LayoutView, "login.html"}
  end

  def healthcheck(conn, _params) do
    json(conn, %{{MODULE_NAME}}.System.Healthcheck{
      application: :{{APP_NAME}}_cms,
      application_version: {{MODULE_NAME}}Cms.Mixfile.project[:version],
      current_url: current_path(conn),
      host: Plug.Conn.get_req_header(conn, "host")}
    )
  end

end
