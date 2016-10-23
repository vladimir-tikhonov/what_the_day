defmodule WhatTheDay.Router do
  use Phoenix.Router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", WhatTheDay.Controllers.Api.V1 do
    pipe_through :api

    get "/global_celebrations", GlobalCelebrationsController, :index
  end
end
