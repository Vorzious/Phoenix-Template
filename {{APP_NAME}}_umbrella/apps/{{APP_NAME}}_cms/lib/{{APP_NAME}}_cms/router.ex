defmodule {{MODULE_NAME}}Cms.Router do
  use {{MODULE_NAME}}Cms, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Guest Zone
  scope "/cms/", {{MODULE_NAME}}Cms do
    pipe_through [:browser] # Use the default browser stack

    scope "/" do
      get "/", PageController, :index
      get "/healthcheck", PageController, :healthcheck
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", {{MODULE_NAME}}Cms do
  #   pipe_through :api
  # end
end
