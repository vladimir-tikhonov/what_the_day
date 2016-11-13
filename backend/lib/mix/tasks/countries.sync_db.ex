defmodule Mix.Tasks.Countries.SyncDb do
  @moduledoc """
    Task to sync database with WhatTheDay.Repositories.CountriesRepository
  """

  use Mix.Task

  import Ecto.Query
  import Mix.Ecto

  alias WhatTheDay.Models.Country, as: CountryModel
  alias WhatTheDay.Repo
  alias WhatTheDay.Repositories.CountriesRepository

  def run(_) do
    ensure_started(Repo, [])
    all_country_ids = CountriesRepository.all |> Enum.map(&(&1.id()))
    existing_country_ids = get_existing_country_ids()

    missing_country_ids = all_country_ids -- existing_country_ids
    extra_country_ids = existing_country_ids -- all_country_ids

    add_missing_countries(missing_country_ids)
    IO.puts("")
    remove_extra_countries(extra_country_ids)
    IO.puts("")
  end

  defp get_existing_country_ids do
    Repo.all(from gc in CountryModel, select: gc.id)
  end

  defp add_missing_countries([]), do: IO.puts("--- No new countries detected ---")
  defp add_missing_countries(country_ids) do
    IO.puts("Inserting new countries:")
    IO.inspect(country_ids)

    Repo.insert_all(
      CountryModel,
      Enum.map(country_ids, &(%{id: &1}))
    )
  end

  defp remove_extra_countries([]), do: IO.puts("--- No extra countries detected ---")
  defp remove_extra_countries(country_ids) do
    IO.puts("Removing extra countries:")
    IO.inspect(country_ids)

    Repo.delete_all(from gc in CountryModel, where: gc.id in ^country_ids)
  end
end
