defmodule Califa.Repo.Migrations.UniqueIndexCustomerEmail do
  use Ecto.Migration

  def change do
    create unique_index(:customers, [:email], name: :email_unique_index)
  end
end
