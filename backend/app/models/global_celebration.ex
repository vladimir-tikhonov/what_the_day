defmodule WhatTheDay.Models.GlobalCelebration do
  @moduledoc """
    Represents WhatTheDay.GlobalCelebrations.* modules in database
  """

  use WhatTheDay.Model

  @primary_key {:id, :string, []}
  schema("global_celebrations") do
  end
end
