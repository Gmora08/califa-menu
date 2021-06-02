defmodule CalifaWeb.Schema.Resolvers.Menu do
  alias Califa.Repo
  alias Califa.Menu

  def categories(_parent, args, _res) do
    IO.inspect(args, label: "Menu args ==>")
    {:ok, Menu.list_categories(args)}
  end

  def create_category(_parent, args, _res) do
    Menu.create_category(args)
  end

  def create_dish(_parent, %{input: params} = _args, _res) do
    Menu.create_dish(params)
  end

  def dishes(parent, args, _res) do
    IO.inspect(parent, label: "Dishes parent ===>")
    {:ok, Menu.list_dishes(args, parent)}
  end

  def dish_category(dish, _args, _res) do
    dish = Repo.preload(dish, :categories)

    {:ok, dish.categories}
  end
end
