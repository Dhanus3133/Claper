defmodule Claper.Embeds.Embed do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:title, :content, :position]}
  schema "embeds" do
    field :title, :string
    field :content, :string
    field :enabled, :boolean, default: true
    field :position, :integer, default: 0

    belongs_to :presentation_file, Claper.Presentations.PresentationFile

    timestamps()
  end

  @doc false
  def changeset(embed, attrs \\ %{}) do
    embed
    |> cast(attrs, [:enabled, :title, :content, :presentation_file_id, :position])
    |> validate_required([:title, :content, :presentation_file_id, :position])
  end
end