defmodule WhatTheDay.GlobalCelebrations.MothersDay do
  @moduledoc """
  Wiki: https://en.wikipedia.org/wiki/Mother%27s_Day
  """

  use WhatTheDay.GlobalCelebration

  alias WhatTheDay.Countries
  alias WhatTheDay.DateMatchers

  @id "mothers_day"
  def id, do: @id

  def countries_date_matcher() do
    %{
      Countries.Belarus => %DateMatchers.Simple{day: 14, month: 10}
    }
  end
end
