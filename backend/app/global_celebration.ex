defmodule WhatTheDay.GlobalCelebration do
  @moduledoc false
  @type date_matcher :: %WhatTheDay.DateMatchers.Simple{}
                      | %WhatTheDay.DateMatchers.Countdown{}
                      | %WhatTheDay.DateMatchers.Falsy{}

  @callback id() :: String.t
  @callback countries_date_matcher() :: %{atom => date_matcher}

  alias(WhatTheDay.Utils.DateMatchersHelper)

  defmacro __using__(_) do
    quote do
      @behaviour WhatTheDay.GlobalCelebration

      def celebrated_at?(country) do
        countries_date_matcher = countries_date_matcher()

        has_fallback_matcher = Map.has_key?(countries_date_matcher, nil)
        case Map.get(countries_date_matcher, country) do
          nil -> has_fallback_matcher
          %WhatTheDay.DateMatchers.Falsy{} -> false
          _ -> true
        end
      end

      def when_celebrated(country) do
        DateMatchersHelper.when_celebrated(country_date_matcher(country))
      end

      def days_left(date, country) do
        DateMatchersHelper.days_left(date, country_date_matcher(country))
      end

      def to_json(date, country) do
        %{
          id: id(),
          when_celebrated: when_celebrated(country),
          days_left: days_left(date, country)
        }
      end

      defp country_date_matcher(country) do
        Map.get(countries_date_matcher(), country, default_matcher())
      end

      defp default_matcher() do
        Map.get(countries_date_matcher(), nil)
      end
    end
  end
end
