defmodule CalifaWeb.Schema.Resolvers.Customer do
  alias Califa.Customers
  alias Califa.Orders.Order

  def create_customer(_parent, %{input: params}, _res) do
    Customers.create_customer(params)
  end

  def get_customer(%Order{} = order, _args, _res) do
    {:ok, Customers.get_customer!(order.customer_id)}
  end
end
