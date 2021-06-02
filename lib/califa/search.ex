defmodule Califa.Search do
  import Ecto.Query

  alias Califa.Menu.{Category, Dish}
  alias Califa.Repo

  @search [Category, Dish]
  def by_id(id) do
    Enum.flat_map(@search, &by_id(&1, id))
  end

  defp by_id(ecto_schema, id) do
    Repo.all(
      from q in ecto_schema, where: q.id == ^id
    )
  end
end
