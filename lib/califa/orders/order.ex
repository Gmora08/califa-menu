defmodule Califa.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :total, :integer
    many_to_many(
      :dishes,
      Califa.Menu.Dish,
      join_through: "order_dish",
      on_replace: :delete
    )
    belongs_to :order_status, Califa.Orders.OrderStatus, foreign_key: :status_id
    belongs_to :customers, Califa.Customers.Customer, foreign_key: :customer_id

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:total, :customer_id, :status_id])
    |> validate_required([:total])
    |> foreign_key_constraint(:category_id)
    |> foreign_key_constraint(:status_id)
  end
end
