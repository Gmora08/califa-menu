defmodule CalifaWeb.Schema.Types.MenuTypes do
  use Absinthe.Schema.Notation

  alias Absinthe.Blueprint.Input
  alias CalifaWeb.Schema.Resolvers

  @desc "Dishes categories"
  object :category do
    field :id, :id
    field :name, :string
    field :dishes, list_of(:dish) do
      resolve &Resolvers.Menu.category_dishes/3
    end
  end

  @desc "Dishes that are on the menu"
  object :dish do
    field :id, :id
    field :name, :string
    field :portion, :portion
    field :price, :money
    field :categories, list_of(:category) do
      resolve &Resolvers.Menu.dish_category/3
    end
  end

  @desc "Object to create a dish"
  input_object :dish_input do
    field :name, non_null(:string)
    field :portion, non_null(:portion)
    field :price, non_null(:money)
    field :category, non_null(:id)
  end

  @desc """
  The `Portion` scalar type is a more readable representation for clients
  """
  scalar :portion, name: "Portion" do
    parse &parse_portion/1
    serialize &serialize_portion/1
  end

  defp serialize_portion(value), do: "#{value}g"

  defp parse_portion(%Input.String{value: value}) do
    value =
      value
      |> String.replace("g", "")
      |> String.to_integer()

    {:ok, value}

  rescue
    _ -> :error
  end
end
