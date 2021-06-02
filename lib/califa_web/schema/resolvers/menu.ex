defmodule CalifaWeb.Schema.Resolvers.Menu do
  alias Califa.Repo
  alias Califa.{Menu, Orders}
  alias Califa.Orders.Order

  def categories(_parent, args, _res) do
    {:ok, Menu.list_categories(args)}
  end

  def create_category(_parent, args, _res) do
    Menu.create_category(args)
  end

  def create_dish(_parent, %{input: params} = _args, _res) do
    Menu.create_dish(params)
  end

  def dishes(%Order{} = order, _args, res) do
    Orders.list_order_dishes(order.id)
  end

  def dishes(parent, args, _res) do
    {:ok, Menu.list_dishes(args, parent)}
  end

  def dish_category(dish, _args, _res) do
    dish = Repo.preload(dish, :categories)

    {:ok, dish.categories}
  end
end
