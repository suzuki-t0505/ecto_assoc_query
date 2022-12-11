defmodule EctoAssocQuery.PrayListMusic do
  use Ecto.Schema

  schema "pray_list_musics" do
    belongs_to :pray_list, EctoAssocQuery.PrayList
    belongs_to :music, EctoAssocQuery.Music
  end
end
