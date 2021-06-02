defmodule Califa.Customers.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "customers" do
    field :email, :string
    field :last_name, :string
    field :name, :string
    has_many :orders, Califa.Orders.Order, foreign_key: :customer_id

    timestamps()
  end

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [:name, :last_name, :email])
    |> validate_required([:name, :last_name, :email])
    |> unique_constraint(:email, name: :email_unique_index, message: "already exists")
  end
end
