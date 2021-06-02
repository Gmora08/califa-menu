defmodule CalifaWeb.Schema.Mutations.Customer do
  use Absinthe.Schema.Notation

  alias CalifaWeb.Schema.Resolvers

  object :customer_mutations do
    field :create_customer, :customer do
      arg :input, non_null(:customer_input)

      resolve &Resolvers.Customer.create_customer/3
    end
  end
end
