defmodule Califa.Repo.Migrations.CreateDishes do
  use Ecto.Migration

  def change do
    create table(:dishes) do
      add :name, :string
      add :price, :integer
      add :portion, :integer
      add :category_id, references(:categories, on_delete: :delete_all)

      timestamps()
    end

    create index(:dishes, [:category_id])
  end
end
