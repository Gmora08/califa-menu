defmodule CalifaWeb.Schema.Resolvers.Customer do
  alias Califa.Customers

  def create_customer(_parent, %{input: params}, _res) do
    Customers.create_customer(params)
  end
end
