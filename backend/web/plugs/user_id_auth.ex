defmodule WhatTheDay.Plugs.UserIdAuth do
  @moduledoc """
    Allows to authentificate by passing `user_id` param in request.
    Usefull in development environment.
  """

  import Plug.Conn
  import Phoenix.Controller

  alias WhatTheDay.Models.User, as: UserModel
  alias WhatTheDay.Repo

  def init(default), do: default

  def call(conn, _default) do
    assign_user(conn, conn.params["user_id"])
  end

  defp assign_user(conn, nil), do: conn
  defp assign_user(conn, user_id) do
    user = Repo.get(UserModel, user_id)
    if user do
      assign(conn, :current_user, user)
    else
      conn
        |> put_status(:forbidden)
        |> json(%{error: "There is no user with id = #{user_id}"})
        |> halt
    end
  end
end
