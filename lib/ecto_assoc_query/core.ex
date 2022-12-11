defmodule EctoAssocQuery.Core do
  alias EctoAssocQuery.{Repo, User, Artist, Music}
  import Ecto.Query

  def get_active_users() do
    query =
      from(u in User,
        join: au in assoc(u, :active_user)
      )

    Repo.all(query)
  end

  def get_artist_list(user_id) do
    query =
      from(a in Artist,
        join: ml in assoc(a, :music_lists),
        join: m in assoc(ml, :musics),
        join: plm in assoc(m, :pray_list_musics),
        join: pl in assoc(plm, :pray_list),
        join: u in assoc(pl, :user),
        where: u.id == ^user_id
      )

    query
    |> Repo.all()
    |> Enum.sort()
    |> Enum.uniq()
  end

  def get_users() do
    query =
      from(u in User,
        left_join: au in assoc(u, :active_user)
      )

    Repo.all(query)
  end

  def get_user(user_id) do
    query =
      from(u in User,
        join: au in assoc(u, :active_user),
        where: u.id == ^user_id,
        preload: :musics
      )

    Repo.one(query)
  end

  # def test(user_id, value) do
  #   pattern = "%#{value}%"



  #   query =
  #     from(m in Music,
  #       where: like(m.name, ^pattern),

  #     )

  #   Repo.all(query)
  # end
end
