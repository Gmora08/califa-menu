defmodule Califa.Menu.Dish do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dishes" do
    field :name, :string
    field :portion, :integer
    field :price, :integer
    many_to_many(
      :orders,
      Califa.Orders.Order,
      join_through: "order_dish",
      on_replace: :delete
    )
    belongs_to :categories, Califa.Menu.Category, foreign_key: :category_id

    timestamps()
  end

  @doc false
  def changeset(dish, attrs) do
    dish
    |> cast(attrs, [:name, :price, :portion, :category_id])
    |> validate_required([:name, :price, :portion])
    |> foreign_key_constraint(:category_id)
  end
end
