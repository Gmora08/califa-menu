defmodule CalifaWeb.Schema do
  use Absinthe.Schema

  import_types CalifaWeb.Schema.Types.CustomerTypes
  import_types CalifaWeb.Schema.Types.MenuTypes
  import_types CalifaWeb.Schema.Types.Money
  import_types CalifaWeb.Schema.Types.OrdersTypes
  import_types CalifaWeb.Schema.Mutations.Menu
  import_types CalifaWeb.Schema.Queries.MenuQueries

  query do
    import_fields :menu_queries
  end

  mutation do
    import_fields :menu_mutations
  end
end
