defmodule WhatTheDay.Repo.Migrations.CreateGlobalCelebrations do
  use Ecto.Migration

  def change do
    create table(:global_celebrations, primary_key: false) do
      add(:id, :string, primary_key: true)
    end
  end
end
