defmodule WhatTheDay.GlobalCelebrations.ProgrammersDay do
  @moduledoc false
  use(WhatTheDay.GlobalCelebration)

  alias(WhatTheDay.DateMatchers)

  @id "programmers_day"
  def id, do: @id

  def countries_date_matcher() do
    %{
      nil => %DateMatchers.Countdown{countdown_func: &countdown/1}
    }
  end

  defp countdown(_) do
    42 # TODO: use proper date library to check if it 256th day of the year
  end
end
