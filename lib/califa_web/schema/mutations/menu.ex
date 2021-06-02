defmodule CalifaWeb.Schema.Mutations.Menu do
  use Absinthe.Schema.Notation

  alias CalifaWeb.Schema.Resolvers

  object :menu_mutations do
    field :create_category, :category do
      arg :name, non_null(:string)

      resolve &Resolvers.Menu.create_category/3
    end

    field :create_dish, :dish do
      arg :input, non_null(:dish_input)
      resolve &Resolvers.Menu.create_dish/3
    end
  end
end
