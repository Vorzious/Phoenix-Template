defmodule {{MODULE_NAME}}Web.PageController do
  use {{MODULE_NAME}}Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def sitemap(conn, _) do
    urls = [
      {{MODULE_NAME}}Web.Router.Helpers.page_url(conn, :index),
    ]

    conn
      |> render("sitemap.txt", urls: urls)
  end

  def healthcheck(conn, _params) do
    json(conn, %{{MODULE_NAME}}.System.Healthcheck{
      application: :{{APP_NAME}}_web,
      application_version: {{MODULE_NAME}}Web.Mixfile.project[:version],
      current_url: current_path(conn),
      host: Plug.Conn.get_req_header(conn, "host")}
    )
  end

end
