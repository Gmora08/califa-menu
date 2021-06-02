defmodule CalifaWeb.Schema.Queries.Orders do
  use Absinthe.Schema.Notation

  alias CalifaWeb.Schema.Resolvers

  object :order_queries do
    @desc "List order status"
    field :order_status, list_of(:order_status) do
      resolve &Resolvers.Orders.order_status/3
    end

    @desc "List of orders"
    field :orders, list_of(:order) do
      resolve &Resolvers.Orders.get_orders/3
    end
  end
end
