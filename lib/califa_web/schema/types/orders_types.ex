defmodule CalifaWeb.Schema.Types.OrdersTypes do
  use Absinthe.Schema.Notation

  @desc "Order status, possible values could be (doing, ready, served)"
  object :order_status do
    field :name, :string
  end

  object :order do
    field :total, non_null(:money)
    # field :order_status, list_of(:order_status) do
      # resolve &Resolvers.Customers.customer_orders/3
    # end
  end
end
