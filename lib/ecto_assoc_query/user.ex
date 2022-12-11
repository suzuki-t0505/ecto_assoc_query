defmodule EctoAssocQuery.User do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Inspect, only: [:id, :name, :musics]}
  schema "users" do
    field :name, :string
    field :email, :string
    has_many :pray_lists, EctoAssocQuery.PrayList
    has_many :pray_list_musics, through: [:pray_lists, :pray_list_musics]
    has_many :musics, through: [:pray_list_musics, :music]
    has_many :music_lists, through: [:musics, :music_list]
    has_many :artists, through: [:music_lists, :artist]
    has_one :active_user, EctoAssocQuery.ActiveUser
    has_one :delete_user, EctoAssocQuery.DeleteUser
  end

  def changeset(user, params) do
    user
    |> cast(params, [:name, :email])
    |> validate_required(:name, message: "Please enter your name.")
    |> validate_required(:email, message: "Please enter your email.")
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "Must include the @ symbol, do not include spaces.")
    |> unique_constraint(:email, message: "Email has already been retrieved.")
    |> unsafe_validate_unique(:email, EctoAssocQuery.Repo, message: "Email has already been retrieved.")
  end
end
