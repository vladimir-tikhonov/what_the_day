defmodule WhatTheDay.Controllers.Api.V1.GlobalEventsController do
  use WhatTheDay.Web, :controller

  def index(conn, _params) do
    json(conn, %{hello: "world"})
  end
end
