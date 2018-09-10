defmodule {{MODULE_NAME}}Web.Router do
  use {{MODULE_NAME}}Web, :router

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

  scope "/", {{MODULE_NAME}}Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/sitemap.txt", PageController, :sitemap
    get "/healthcheck", PageController, :healthcheck
  end

  # Other scopes may use custom stacks.
  # scope "/api", {{MODULE_NAME}}Web do
  #   pipe_through :api
  # end
end
