defmodule CalifaWeb.Schema.Resolvers.Menu do
  alias Califa.Repo
  alias Califa.Menu

  def dish_category(dish, _args, _res) do
    {:ok, Repo.preload(dish, :categories)}
  end

  def categories(_parent, _args, _res) do
    {:ok, Menu.list_categories()}
  end

  def category_dishes(category, _args, _res) do
    {:ok, Repo.preload(category, :dishes)}
  end

  def create_category(_parent, args, _res) do
    Menu.create_category(args)
  end

  def create_dish(_parent, args, _res) do
    Menu.create_dish(args)
  end
end
