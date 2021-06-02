defmodule CalifaWeb.Schema.Resolvers.Orders do
  alias Califa.Orders

  def order_status(_parent, _args, _res) do
    {:ok, Orders.list_order_status()}
  end

  def get_orders(_parent, _args, _res) do
    {:ok, Orders.list_orders()}
  end
end
