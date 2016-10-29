defmodule WhatTheDay.CelebrationTools do
  @moduledoc false

  use ExUnit.CaseTemplate

  using do
    quote do
      use Timex

      def assert_celebrated_on(celebration, date, country \\ WhatTheDay.Countries.Dummy) do
        assert(celebration.celebrated_at?(country),
          "Celebration #{celebration} does not exists for country #{country}")

        assert(celebration.days_left(date, country) == 0,
          "Country #{country} does not celebrate #{celebration} on #{date}")
      end
    end
  end
end
