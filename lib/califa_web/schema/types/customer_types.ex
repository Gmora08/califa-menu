defmodule CalifaWeb.Schema.Types.CustomerTypes do
  use Absinthe.Schema.Notation

  @desc "Customer representation"
  object :customer do
    field :email, :string
    field :last_name, :string
    field :name, :string
    # field :orders, list_of(:orders) do
      # resolve &Resolvers.Customers.customer_orders/3
    # end
  end
end
