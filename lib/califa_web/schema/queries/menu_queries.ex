defmodule CalifaWeb.Schema.Queries.MenuQueries do
  use Absinthe.Schema.Notation

  alias alias CalifaWeb.Schema.Resolvers

  object :menu_queries do
    @desc "Return the categories of the menu"
    field :categories, list_of(:category) do
      resolve &Resolvers.Menu.categories/3
    end
  end
end
