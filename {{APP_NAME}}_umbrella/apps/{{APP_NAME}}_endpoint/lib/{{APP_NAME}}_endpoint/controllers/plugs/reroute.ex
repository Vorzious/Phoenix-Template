defmodule {{MODULE_NAME}}Endpoint.Reroute do
  import Plug.Conn

  def init(opts) do
    {{MODULE_NAME}}Api.Router.init(opts) #YipYip-Scaffold-Remove-API
    {{MODULE_NAME}}Cms.Router.init(opts) #YipYip-Scaffold-Remove-CMS
    {{MODULE_NAME}}Web.Router.init(opts) #YipYip-Scaffold-Remove-WEB
  end

  def call(conn, params) do
    case conn.path_info do
      ["api" | _] -> {{MODULE_NAME}}Api.Router.call(conn, params) #YipYip-Scaffold-Remove-API
      ["cms" | _] -> {{MODULE_NAME}}Cms.Router.call(conn, params) #YipYip-Scaffold-Remove-CMS
      _ -> {{MODULE_NAME}}Web.Router.call(conn, params) #YipYip-Scaffold-Remove-WEB
    end
  end
end
