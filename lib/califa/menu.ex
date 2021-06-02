defmodule Califa.Menu do
  @moduledoc """
  The Menu context.
  """

  import Ecto.Query, warn: false
  alias Califa.Repo

  alias Califa.Menu.Category

  @doc """
  Returns the list of categories.

  ## Examples

      iex> list_categories()
      [%Category{}, ...]

  """
  def list_categories(filters \\ %{}) do

    filters
    |> Enum.reduce(Category, fn
      {_, nil}, query -> query
      {:filter, filter}, query ->

        IO.inspect(filter, label: "Filters xx==>")
        IO.inspect(query, label: "Filters xx==>")

        filter_category_with(query, filter)
    end)
    |> Repo.all()
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

      iex> get_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Ecto.Changeset{data: %Category{}}

  """
  def change_category(%Category{} = category, attrs \\ %{}) do
    Category.changeset(category, attrs)
  end

  alias Califa.Menu.Dish

  @doc """
  Returns the list of dishes.

  ## Examples

      iex> list_dishes()
      [%Dish{}, ...]

  """
  def list_dishes(filters \\ %{}, category \\ nil) do
    filters
    |> Enum.reduce(Dish, fn
      {_, nil}, query -> query
      {:dish_filter, dish_filters}, query ->
        filter_dish_with(query, dish_filters)
    end)
    |> where_dish_category(category)
    |> Repo.all()
  end

  @doc """
  Gets a single dish.

  Raises `Ecto.NoResultsError` if the Dish does not exist.

  ## Examples

      iex> get_dish!(123)
      %Dish{}

      iex> get_dish!(456)
      ** (Ecto.NoResultsError)

  """
  def get_dish!(id), do: Repo.get!(Dish, id)

  @doc """
  Creates a dish.

  ## Examples

      iex> create_dish(%{field: value})
      {:ok, %Dish{}}

      iex> create_dish(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_dish(attrs \\ %{}) do
    %Dish{}
    |> Dish.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a dish.

  ## Examples

      iex> update_dish(dish, %{field: new_value})
      {:ok, %Dish{}}

      iex> update_dish(dish, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_dish(%Dish{} = dish, attrs) do
    dish
    |> Dish.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a dish.

  ## Examples

      iex> delete_dish(dish)
      {:ok, %Dish{}}

      iex> delete_dish(dish)
      {:error, %Ecto.Changeset{}}

  """
  def delete_dish(%Dish{} = dish) do
    Repo.delete(dish)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking dish changes.

  ## Examples

      iex> change_dish(dish)
      %Ecto.Changeset{data: %Dish{}}

  """
  def change_dish(%Dish{} = dish, attrs \\ %{}) do
    Dish.changeset(dish, attrs)
  end

  defp filter_category_with(query, filters) do
    filters
    |> Enum.reduce(query, fn
      {:category, category}, query ->
        category = to_string(category)
        where_category(query, category)
    end)
  end

  defp where_category(query, category) do
    from q in query, where: q.name == ^category
  end

  defp filter_dish_with(query, filters) do
    filters
    |> Enum.reduce(query, fn
      {:below_price, price}, query ->
        with_price(:below, price, query)
      {:over_price, price}, query ->
        with_price(:over, price, query)
    end)
  end

  defp with_price(:below, price, query) do
    from q in query, where: q.price <= ^price
  end

  defp with_price(:over, price, query) do
    from q in query, where: q.price > ^price
  end

  defp where_dish_category(query, %Category{} = category) do
    from q in query, where: q.category_id == ^category.id
  end
  defp where_dish_category(query, _), do: query
end
