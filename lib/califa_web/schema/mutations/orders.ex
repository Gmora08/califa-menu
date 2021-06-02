defmodule CalifaWeb.Schema.Mutations.Orders do
  use Absinthe.Schema.Notation

  alias CalifaWeb.Schema.Resolvers

  object :order_mutations do
    field :create_order, :order do
      arg :input, non_null(:order_input)

      resolve &CalifaWeb.Schema.Resolvers.Orders.create_order/3
    end
  end
end
