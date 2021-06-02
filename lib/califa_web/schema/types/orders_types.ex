defmodule CalifaWeb.Schema.Types.OrdersTypes do
  use Absinthe.Schema.Notation

  alias CalifaWeb.Schema.Resolvers

  @desc "Order status, possible values could be (doing, ready, served)"
  object :order_status do
    field :id, :id
    field :name, :string
  end

  @desc "Order with dishes, customer and status"
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

  @desc "Object to create a order"
  input_object :order_input do
    field :customer_id, non_null(:id)
    field :dishes, non_null(list_of(:dish_order))
  end

  input_object :dish_order do
    field :quantity, :integer, default_value: 1
    field :dish_id, non_null(:id)
  end
end
