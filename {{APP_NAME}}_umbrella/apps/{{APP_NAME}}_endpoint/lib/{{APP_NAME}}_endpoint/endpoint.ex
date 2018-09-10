defmodule {{MODULE_NAME}}Endpoint.Endpoint do
  use Phoenix.Endpoint, otp_app: :{{APP_NAME}}_endpoint

  # socket "/socket", {{MODULE_NAME}}Endpoint.UserSocket

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phoenix.digest
  # when deploying your static files in production.
  plug Plug.Static, #YipYip-Scaffold-Remove-WEB
    at: "/", from: :{{APP_NAME}}_web, gzip: false, #YipYip-Scaffold-Remove-WEB
    only: ~w(css fonts images js favicon.ico robots.txt) #YipYip-Scaffold-Remove-WEB
  
  plug Plug.Static, #YipYip-Scaffold-Remove-API
  at: "/api", from: :{{APP_NAME}}_api, gzip: false, #YipYip-Scaffold-Remove-API
  only: ~w(css fonts images js favicon.ico robots.txt) #YipYip-Scaffold-Remove-API
  
  plug Plug.Static, #YipYip-Scaffold-Remove-CMS
    at: "/cms/", from: :{{APP_NAME}}_cms, gzip: false, #YipYip-Scaffold-Remove-CMS
    only: ~w(css fonts images js favicon.ico robots.txt) #YipYip-Scaffold-Remove-CMS

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug Plug.Session,
    store: :cookie,
    key: "_{{APP_NAME}}_endpoint_key",
    signing_salt: "XlkupJTx"

  plug {{MODULE_NAME}}Endpoint.Reroute

  @doc """
  Callback invoked for dynamically configuring the endpoint.

  It receives the endpoint configuration and checks if
  configuration should be loaded from the system environment.
  """
  def init(_key, config) do
    if config[:load_from_system_env] do
      port = System.get_env("PORT") || raise "expected the PORT environment variable to be set"
      {:ok, Keyword.put(config, :http, [:inet6, port: port])}
    else
      {:ok, config}
    end
  end
end
