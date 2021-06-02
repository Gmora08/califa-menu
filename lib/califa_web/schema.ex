defmodule CalifaWeb.Schema do
  use Absinthe.Schema

  import_types CalifaWeb.Schema.Interfaces
  import_types CalifaWeb.Schema.Mutations.{Customer, Menu, Orders}
  import_types CalifaWeb.Schema.Queries.{MenuQueries, Orders, Searches}
  import_types CalifaWeb.Schema.Types.{
    CustomerTypes,
    MenuTypes,
    Money,
    OrdersTypes
  }

  def middleware(middleware, _field, %{identifier: type}) when type in [:query, :mutation] do
    middleware ++ [CalifaWeb.Schema.Middlewares.ErrorHandler]
  end

  def middleware(middleware, _field, _object) do
    middleware
  end

  query do
    import_fields :menu_queries
    import_fields :order_queries
    import_fields :search_queries
  end

  mutation do
    import_fields :customer_mutations
    import_fields :menu_mutations
    import_fields :order_mutations
  end
end
