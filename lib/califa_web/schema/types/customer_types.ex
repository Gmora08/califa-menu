defmodule CalifaWeb.Schema.Types.CustomerTypes do
  use Absinthe.Schema.Notation

  @desc "Customer representation"
  object :customer do
    field :email, :string
    field :last_name, :string
    field :name, :string
  end

  @desc "Object to create a customer"
  input_object :customer_input do
    field :email, :string
    field :last_name, :string
    field :name, :string
  end
end
