defmodule Califa.Orders.OrderStatus do
  use Ecto.Schema
  import Ecto.Changeset

  schema "order_status" do
    field :name, :string
    has_many :orders, Califa.Orders.Order, foreign_key: :status_id

    timestamps()
  end

  @doc false
  def changeset(order_status, attrs) do
    order_status
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
