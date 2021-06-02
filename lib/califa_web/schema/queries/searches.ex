defmodule CalifaWeb.Schema.Queries.Searches do
  use Absinthe.Schema.Notation

  alias alias CalifaWeb.Schema.Resolvers

  object :search_queries do
    @desc "Get a entity by Id"
    field :search_by_id, list_of(:search_by_id) do
      arg :id, non_null(:id)
      resolve &Resolvers.Searches.search_by_id/3
    end
  end
end
