defmodule CalifaWeb.Schema.Resolvers.Orders do
  alias Califa.Orders

  def order_status(_parent, _args, _res) do
    {:ok, Orders.list_order_status()}
  end

  def get_orders(_parent, _args, _res) do
    {:ok, Orders.list_orders()}
  end

  def create_order(_parent, %{input: params}, _res) do
    IO.inspect(params, label: "Entrada de dishes ===>")
    dish_ids = Enum.map(params.dishes, &(&1.dish_id))

    with {:ok, %{ids: _, total: total}} <- Orders.get_dishes_for_order(dish_ids),
         params <- Map.put(params, :total, total),
         {:ok, %{order: order} = _} <- Orders.create_order_transaction(params),
         :ok <- Absinthe.Subscription.publish(CalifaWeb.Endpoint, order, new_order: "*") do
          {:ok, order}
    else
      {:error, :dishes_not_found} -> {:error, "Invalid dishes names"}
    end
  end
end
