defmodule WhatTheDay.Countries.Dummy do
  @moduledoc """
  Used in the tests to check international celebrations
  """

  @behaviour WhatTheDay.Country

  def id, do: "use-me-only-for-testing"
end
