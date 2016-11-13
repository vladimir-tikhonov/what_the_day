defmodule WhatTheDay.Repositories.CountriesRepository do
  @moduledoc false
  alias WhatTheDay.Countries

  @countries [
    Countries.Belarus,
  ]

  def all, do: @countries
end
