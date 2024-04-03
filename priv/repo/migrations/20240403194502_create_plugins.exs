defmodule LivePress.Repo.Migrations.CreatePlugins do
  use Ecto.Migration

  def change do
    create table(:plugins) do
      add :name, :string
      add :source, :string

      timestamps(type: :utc_datetime)
    end
  end
end
