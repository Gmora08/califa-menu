defmodule Califa.Repo.Migrations.UniqueCategoryIndex do
  use Ecto.Migration

  def change do
    create unique_index(:categories, [:name], name: :name_unique_index)
  end
end
