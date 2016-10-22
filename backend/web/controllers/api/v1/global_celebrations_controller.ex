defmodule WhatTheDay.Controllers.Api.V1.GlobalCelebrationsController do
  use WhatTheDay.Web, :controller

  alias(WhatTheDay.Repositories.GlobalCelebrationsRepository)

  def index(conn, _params) do
    country = WhatTheDay.Countries.Belarus # TODO: fetch from current user
    date = ~D[2016-10-10] # TODO: get current date

    celebrations =
      GlobalCelebrationsRepository.celebrations_at_country(country) |>
      Enum.map(&(&1.to_json(date, country)))

    json(conn, celebrations)
  end
end
