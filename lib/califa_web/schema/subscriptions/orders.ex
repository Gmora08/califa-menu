defmodule CalifaWeb.Schema.Subscriptions.Orders do
  use Absinthe.Schema.Notation

  object :order_subscriptions do
    field :new_order, :order do
      config fn _args, _info ->
        {:ok, topic: "*"}
      end
    end
  end
end
