defmodule CalifaWeb.Schema.Resolvers.Searches do
  alias Califa.Search

  def search_by_id(_parent, %{id: id}, _res) do
    {:ok, Search.by_id(id)}
  end
end
