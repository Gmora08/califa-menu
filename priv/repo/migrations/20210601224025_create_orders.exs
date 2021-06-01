defmodule Califa.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :total, :integer
      add :status_id, references(:order_status, on_delete: :nothing)
      add :customer_id, references(:customers, on_delete: :delete_all)

      timestamps()
    end

    create index(:orders, [:status_id])
    create index(:orders, [:customer_id])
  end
end
