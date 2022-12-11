defmodule EctoAssocQuery.Repo.Migrations.CreatePrayLists do
  use Ecto.Migration

  def change do
    create table(:pray_lists) do
      add :name, :string, null: false
      add :user_id, references(:users), null: false
    end
  end
end
