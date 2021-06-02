defmodule CalifaWeb.Schema.Resolvers.Menu do
  alias Califa.Repo
  alias Califa.Menu

  def categories(_parent, _args, _res) do
    {:ok, Menu.list_categories()}
  end

  def category_dishes(category, _args, _res) do
    category = Repo.preload(category, :dishes)
    {:ok, category.dishes}
  end

  def create_category(_parent, args, _res) do
    Menu.create_category(args)
  end

  def create_dish(_parent, %{input: params} = _args, _res) do
    Menu.create_dish(params)
  end

  def dishes(_parent, _args, _res) do
    {:ok, Menu.list_dishes()}
  end

  def dish_category(dish, _args, _res) do
    dish = Repo.preload(dish, :categories)

    {:ok, dish.categories}
  end
end
