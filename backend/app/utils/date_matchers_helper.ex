defmodule WhatTheDay.Utils.DateMatchersHelper do
  @moduledoc false
  use Timex

  alias WhatTheDay.DateMatchers

  def matches?(%Date{day: day, month: month}, %DateMatchers.Simple{day: day, month: month}), do: true
  def matches?(%Date{}, %DateMatchers.Simple{}), do: false

  def matches?(date, %DateMatchers.Countdown{countdown_func: countdown_func}) do
    countdown_func.(date) == 0
  end

  def matches?(%Date{}, %DateMatchers.Falsy{}), do: false

  def when_celebrated(%DateMatchers.Simple{day: day, month: month}) do
    %{day: day, month: month}
  end

  def when_celebrated(%DateMatchers.Countdown{}) do
    # Should be localized on the client
    nil
  end

  def days_left(date = %Date{year: year}, %DateMatchers.Simple{day: day, month: month}) do
    {:ok, celebration_date_in_the_current_year} = Date.new(year, month, day)
    celebration_date_in_the_next_year = Timex.shift(celebration_date_in_the_current_year, years: 1)

    curent_year_diff = Timex.diff(celebration_date_in_the_current_year, date, :days)
    if curent_year_diff >= 0 do
      curent_year_diff
    else
      Timex.diff(celebration_date_in_the_next_year, date, :days)
    end
  end

  def days_left(date, %DateMatchers.Countdown{countdown_func: countdown_func}) do
    countdown_func.(date)
  end
end
