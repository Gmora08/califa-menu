defmodule CalifaWeb.Schema.Interfaces do
  use Absinthe.Schema.Notation

  alias Califa.Menu.{Category, Dish}

  interface :search_by_id do
    field :id, :id
    resolve_type fn
      %Dish{}, _ -> :dish
      %Category{}, _ -> :category
    end
  end
end
