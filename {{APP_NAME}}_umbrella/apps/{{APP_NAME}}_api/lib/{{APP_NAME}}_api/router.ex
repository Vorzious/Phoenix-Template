defmodule {{MODULE_NAME}}Api.Router do
  use {{MODULE_NAME}}Api, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", {{MODULE_NAME}}Api do
    pipe_through :api

    get "/healthcheck", ApiController, :healthcheck
  end
end
