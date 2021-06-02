defmodule CalifaWeb.Schema.Types.OrdersTypes do
  use Absinthe.Schema.Notation

  alias CalifaWeb.Schema.Resolvers

  @desc "Order status, possible values could be (doing, ready, served)"
  object :order_status do
    field :id, :id
    field :name, :string
  end

  object :order do
    field :id, :id
    field :total, :money
    field :dishes, list_of(:dish) do
      resolve &Resolvers.Menu.dishes/3
    end
    field :customer, :customer do
      resolve &Resolvers.Customer.get_customer/3
    end
  end
end
