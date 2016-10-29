defmodule WhatTheDay.GlobalCelebrations.ProgrammersDay do
  @moduledoc """
  Wiki: https://en.wikipedia.org/wiki/Day_of_the_Programmer
  """

  use(WhatTheDay.GlobalCelebration)
  use(Timex)

  alias(WhatTheDay.DateMatchers)

  @id "programmers_day"
  @days_shift 255

  def id, do: @id

  def countries_date_matcher() do
    %{
      nil => %DateMatchers.Countdown{countdown_func: &countdown/1}
    }
  end

  defp countdown(date) do
    celebration_date_in_the_current_year = date
      |> Timex.beginning_of_year
      |> Timex.shift(days: @days_shift)

    celebration_date_in_the_next_year = date
      |> Timex.shift(years: 1)
      |> Timex.beginning_of_year
      |> Timex.shift(days: @days_shift)

    curent_year_diff = Timex.diff(celebration_date_in_the_current_year, date, :days)

    if curent_year_diff >= 0 do
      curent_year_diff
    else
      Timex.diff(celebration_date_in_the_next_year, date, :days)
    end
  end
end
