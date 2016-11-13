defmodule WhatTheDay.Models.Country do
  @moduledoc """
    Represents WhatTheDay.Countries.* modules in database
  """

  use WhatTheDay.Model

  @primary_key {:id, :string, []}
  schema("countries") do
  end
end
