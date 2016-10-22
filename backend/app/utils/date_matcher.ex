defmodule WhatTheDay.Utils.DateMatcher do
  alias(WhatTheDay.DateMatchers)

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

  def days_left(_date, %DateMatchers.Simple{}) do
    0 # TODO: calculate when proper date library will be integrated
  end

  def days_left(date, %DateMatchers.Countdown{countdown_func: countdown_func}) do
    countdown_func.(date)
  end
end
