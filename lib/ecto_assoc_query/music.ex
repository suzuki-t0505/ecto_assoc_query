defmodule EctoAssocQuery.Music do
  use Ecto.Schema
  import Ecto.Changeset

  schema "musics" do
    field :name, :string
    belongs_to :music_list, EctoAssocQuery.MusicList
    has_many :pray_list_musics, EctoAssocQuery.PrayListMusic
    has_many :pray_lists, through: [:pray_list_musics, :pray_list]
  end

  def changeset(music, params) do
    music
    |> cast(params, [:name])
    |> validate_required(:name, message: "Please enter your name.")
  end
end
