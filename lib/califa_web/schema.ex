defmodule CalifaWeb.Schema do
  use Absinthe.Schema

  import_types CalifaWeb.Schema.Types.CustomerTypes
  import_types CalifaWeb.Schema.Types.MenuTypes
  import_types CalifaWeb.Schema.Types.Money
  import_types CalifaWeb.Schema.Types.OrdersTypes
  import_types CalifaWeb.Schema.Mutations.Menu
  import_types CalifaWeb.Schema.Interfaces
  import_types CalifaWeb.Schema.Queries.MenuQueries
  import_types CalifaWeb.Schema.Queries.Searches

  def middleware(middleware, _field, %{identifier: :mutation}) do
    middleware ++ [CalifaWeb.Schema.Middlewares.HandleChangesetErrors]
  end
  def middleware(middleware, _field, _object), do: middleware

  query do
    import_fields :menu_queries
    import_fields :search_queries
  end

  mutation do
    import_fields :menu_mutations
  end
end
