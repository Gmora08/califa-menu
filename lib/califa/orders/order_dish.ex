defmodule Califa.Orders.OrderDish do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "order_dish" do
    belongs_to :orders, Califa.Orders.Order, foreign_key: :order_id
    belongs_to :dishes, Califa.Menu.Dish, foreign_key: :dish_id
    field :quantity, :integer, default: 1

    timestamps()
  end

  @doc false
  def changeset(order_dish, attrs) do
    order_dish
    |> cast(attrs, [:quantity, :order_id, :dish_id])
    |> validate_required([])
    |> foreign_key_constraint(:order_id)
    |> foreign_key_constraint(:dish_id)
    |> unique_constraint([:order_id, :dish_id], name: :order_id_dish_id_unique_index, message: "DISH Already exists in ORDER")
  end
end
