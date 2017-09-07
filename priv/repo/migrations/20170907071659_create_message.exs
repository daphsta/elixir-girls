defmodule Slackir.Repo.Migrations.CreateMessage do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :name, :string
      add :message, :text

      timestamps()
    end

  end
end
