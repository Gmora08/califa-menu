defmodule CalifaWeb.Schema.Queries.MenuQueries do
  use Absinthe.Schema.Notation

  alias alias CalifaWeb.Schema.Resolvers

  object :menu_queries do
    @desc "Return the menu"
    field :menu, list_of(:category) do
      arg :filter, :menu_filter
      resolve &Resolvers.Menu.categories/3
    end

    @desc "Return all the dishes of the menu"
    field :dishes, list_of(:dish) do
      arg :dish_filter, :dishes_filter
      resolve &Resolvers.Menu.dishes/3
    end
  end
end
