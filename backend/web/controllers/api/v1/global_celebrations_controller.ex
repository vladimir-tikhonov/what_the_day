defmodule WhatTheDay.Controllers.Api.V1.GlobalCelebrationsController do
  @moduledoc false
  use WhatTheDay.Web, :controller
  use Timex

  alias WhatTheDay.Repositories.GlobalCelebrationsRepository

  def index(conn, _params) do
    country = WhatTheDay.Countries.Belarus # TODO: fetch from request or current user
    date = Timex.now() |> Timex.to_date # TODO: use user's timezone

    celebrations =
      GlobalCelebrationsRepository.celebrations_at_country(country) |>
      Enum.map(&(&1.to_json(date, country)))

    json(conn, %{celebrations: celebrations, country_id: country.id()})
  end
end
