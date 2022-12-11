defmodule EctoAssocQuery.PrayList do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pray_lists" do
    field :name, :string
    belongs_to :user, EctoAssocQuery.User
    has_many :pray_list_musics, EctoAssocQuery.PrayListMusic
    has_many :musics, through: [:pray_list_musics, :musics]
  end

  def changeset(pray_list, params) do
    pray_list
    |> cast(params, [:name])
    |> validate_required(:name, message: "Please enter your name.")
  end
end
