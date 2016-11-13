defmodule WhatTheDay.Repo.Migrations.CreateCountries do
  use Ecto.Migration

  def change do
    create table(:countries, primary_key: false) do
      add(:id, :string, primary_key: true)
    end
  end
end
