defmodule Califa.Repo.Migrations.CreateOrderDish do
  use Ecto.Migration

  def change do
    create table(:order_dish, primary_key: false) do
      add :order_id, references(:orders, on_delete: :delete_all)
      add :dish_id, references(:dishes, on_delete: :delete_all)
      add :quantity, :integer, default: 1

      timestamps()
    end

    create index(:order_dish, [:order_id])
    create index(:order_dish, [:dish_id])
    create unique_index(:order_dish, [:order_id, :dish_id], name: :order_id_dish_id_unique_index)
  end
end
