defmodule GetAJobEx.Router do
  use GetAJobEx.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GetAJobEx do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", GetAJobEx do
    pipe_through :api

    get "/", JobController, :api
    resources "/jobs", JobController
  end
end
