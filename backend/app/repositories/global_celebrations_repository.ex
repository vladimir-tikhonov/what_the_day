defmodule WhatTheDay.Repositories.GlobalCelebrationsRepository do
  @moduledoc false
  alias WhatTheDay.GlobalCelebrations

  @celebrations [
    GlobalCelebrations.MothersDay,
    GlobalCelebrations.ProgrammersDay,
  ]

  def all, do: @celebrations

  def celebrations_at_country(country) do
    Enum.filter(@celebrations, &(&1.celebrated_at?(country)))
  end
end
