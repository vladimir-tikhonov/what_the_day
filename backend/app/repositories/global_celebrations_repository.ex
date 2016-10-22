defmodule WhatTheDay.Repositories.GlobalCelebrationsRepository do
  alias(WhatTheDay.GlobalCelebrations)

  @celebrations [
    GlobalCelebrations.MothersDay,
    GlobalCelebrations.ProgrammersDay
  ]

  def celebrations_at_country(country) do
    Enum.filter(@celebrations, &(&1.celebrated_at?(country)))
  end
end
