defmodule WhatTheDay.Router do
  @moduledoc false
  use Phoenix.Router

  pipeline :api do
    plug :accepts, ["json"]
    if Mix.env === :dev do
      plug WhatTheDay.Plugs.UserIdAuth
    end
  end

  scope "/api/v1", WhatTheDay.Controllers.Api.V1 do
    pipe_through :api

    get "/global_celebrations", GlobalCelebrationsController, :index
  end
end
