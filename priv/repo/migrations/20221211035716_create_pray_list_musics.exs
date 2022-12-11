defmodule EctoAssocQuery.Repo.Migrations.CreatePrayListMusics do
  use Ecto.Migration

  def change do
    create table(:pray_list_musics) do
      add :pray_list_id, references(:pray_lists), null: false
      add :music_id, references(:musics), null: false
    end
  end
end
