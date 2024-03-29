defmodule Califa.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :name, :string
      add :last_name, :string
      add :email, :string

      timestamps()
    end

  end
end
