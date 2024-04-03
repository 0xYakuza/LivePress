defmodule LivePress.Plugin do
  use Ecto.Schema
  import Ecto.Changeset

  schema "plugins" do
    field :name, :string
    field :source, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(plugin, attrs) do
    plugin
    |> cast(attrs, [:name, :source])
    |> validate_required([:name, :source])
  end
end
