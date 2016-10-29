defmodule WhatTheDay.DateTools do
  @moduledoc false

  use ExUnit.CaseTemplate

  using do
    quote do
      use Timex

      def parse_date!(year_month_date_string) do
        Timex.parse!(year_month_date_string, "{YYYY}-{0M}-{D}") |> Timex.to_date
      end
    end
  end
end
