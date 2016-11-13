defmodule Mix.Tasks.GlobalCelebrations.SyncDb do
  @moduledoc """
    Task to sync database with WhatTheDay.Repositories.GlobalCelebrationsRepository
  """

  use Mix.Task

  import Ecto.Query
  import Mix.Ecto

  alias WhatTheDay.Models.GlobalCelebration, as: GlobalCelebrationModel
  alias WhatTheDay.Repo
  alias WhatTheDay.Repositories.GlobalCelebrationsRepository

  def run(_) do
    ensure_started(Repo, [])
    all_celebration_ids = GlobalCelebrationsRepository.all |> Enum.map(&(&1.id()))
    existing_celebration_ids = get_existing_celebration_ids()

    missing_celebration_ids = all_celebration_ids -- existing_celebration_ids
    extra_celebration_ids = existing_celebration_ids -- all_celebration_ids

    add_missing_celebrations(missing_celebration_ids)
    IO.puts("")
    remove_extra_celebrations(extra_celebration_ids)
    IO.puts("")
  end

  defp get_existing_celebration_ids do
    Repo.all(from gc in GlobalCelebrationModel, select: gc.id)
  end

  defp add_missing_celebrations([]), do: IO.puts("--- No new celebrations detected ---")
  defp add_missing_celebrations(celebration_ids) do
    IO.puts("Inserting new celebrations:")
    IO.inspect(celebration_ids)

    Repo.insert_all(
      GlobalCelebrationModel,
      Enum.map(celebration_ids, &(%{id: &1}))
    )
  end

  defp remove_extra_celebrations([]), do: IO.puts("--- No extra celebrations detected ---")
  defp remove_extra_celebrations(celebration_ids) do
    IO.puts("Removing extra celebrations:")
    IO.inspect(celebration_ids)

    Repo.delete_all(from gc in GlobalCelebrationModel, where: gc.id in ^celebration_ids)
  end
end
