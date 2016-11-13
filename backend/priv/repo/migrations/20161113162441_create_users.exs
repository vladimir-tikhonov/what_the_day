defmodule WhatTheDay.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users)
  end
end
