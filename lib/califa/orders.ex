defmodule Califa.Orders do
  @moduledoc """
  The Orders context.
  """

  import Ecto.Query, warn: false
  alias Califa.Repo

  alias Califa.Orders.OrderStatus

  @doc """
  Returns the list of order_status.

  ## Examples

      iex> list_order_status()
      [%OrderStatus{}, ...]

  """
  def list_order_status do
    Repo.all(OrderStatus)
  end

  @doc """
  Gets a single order_status.

  Raises `Ecto.NoResultsError` if the Order status does not exist.

  ## Examples

      iex> get_order_status!(123)
      %OrderStatus{}

      iex> get_order_status!(456)
      ** (Ecto.NoResultsError)

  """
  def get_order_status!(id), do: Repo.get!(OrderStatus, id)

  @doc """
  Creates a order_status.

  ## Examples

      iex> create_order_status(%{field: value})
      {:ok, %OrderStatus{}}

      iex> create_order_status(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_order_status(attrs \\ %{}) do
    %OrderStatus{}
    |> OrderStatus.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a order_status.

  ## Examples

      iex> update_order_status(order_status, %{field: new_value})
      {:ok, %OrderStatus{}}

      iex> update_order_status(order_status, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_order_status(%OrderStatus{} = order_status, attrs) do
    order_status
    |> OrderStatus.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a order_status.

  ## Examples

      iex> delete_order_status(order_status)
      {:ok, %OrderStatus{}}

      iex> delete_order_status(order_status)
      {:error, %Ecto.Changeset{}}

  """
  def delete_order_status(%OrderStatus{} = order_status) do
    Repo.delete(order_status)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking order_status changes.

  ## Examples

      iex> change_order_status(order_status)
      %Ecto.Changeset{data: %OrderStatus{}}

  """
  def change_order_status(%OrderStatus{} = order_status, attrs \\ %{}) do
    OrderStatus.changeset(order_status, attrs)
  end

  alias Califa.Orders.Order

  @doc """
  Returns the list of orders.

  ## Examples

      iex> list_orders()
      [%Order{}, ...]

  """
  def list_orders do
    Repo.all(Order)
  end

  @doc """
  Gets a single order.

  Raises `Ecto.NoResultsError` if the Order does not exist.

  ## Examples

      iex> get_order!(123)
      %Order{}

      iex> get_order!(456)
      ** (Ecto.NoResultsError)

  """
  def get_order!(id), do: Repo.get!(Order, id)

  @doc """
  Creates a order.

  ## Examples

      iex> create_order(%{field: value})
      {:ok, %Order{}}

      iex> create_order(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_order(attrs \\ %{}) do
    %Order{}
    |> Order.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a order.

  ## Examples

      iex> update_order(order, %{field: new_value})
      {:ok, %Order{}}

      iex> update_order(order, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_order(%Order{} = order, attrs) do
    order
    |> Order.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a order.

  ## Examples

      iex> delete_order(order)
      {:ok, %Order{}}

      iex> delete_order(order)
      {:error, %Ecto.Changeset{}}

  """
  def delete_order(%Order{} = order) do
    Repo.delete(order)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking order changes.

  ## Examples

      iex> change_order(order)
      %Ecto.Changeset{data: %Order{}}

  """
  def change_order(%Order{} = order, attrs \\ %{}) do
    Order.changeset(order, attrs)
  end

  alias Califa.Orders.OrderDish

  @doc """
  Returns the list of order_dish.

  ## Examples

      iex> list_order_dish()
      [%OrderDish{}, ...]

  """
  def list_order_dish do
    Repo.all(OrderDish)
  end

  @doc """
  Gets a single order_dish.

  Raises `Ecto.NoResultsError` if the Order dish does not exist.

  ## Examples

      iex> get_order_dish!(123)
      %OrderDish{}

      iex> get_order_dish!(456)
      ** (Ecto.NoResultsError)

  """
  def get_order_dish!(id), do: Repo.get!(OrderDish, id)

  @doc """
  Creates a order_dish.

  ## Examples

      iex> create_order_dish(%{field: value})
      {:ok, %OrderDish{}}

      iex> create_order_dish(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_order_dish(attrs \\ %{}) do
    %OrderDish{}
    |> OrderDish.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a order_dish.

  ## Examples

      iex> update_order_dish(order_dish, %{field: new_value})
      {:ok, %OrderDish{}}

      iex> update_order_dish(order_dish, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_order_dish(%OrderDish{} = order_dish, attrs) do
    order_dish
    |> OrderDish.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a order_dish.

  ## Examples

      iex> delete_order_dish(order_dish)
      {:ok, %OrderDish{}}

      iex> delete_order_dish(order_dish)
      {:error, %Ecto.Changeset{}}

  """
  def delete_order_dish(%OrderDish{} = order_dish) do
    Repo.delete(order_dish)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking order_dish changes.

  ## Examples

      iex> change_order_dish(order_dish)
      %Ecto.Changeset{data: %OrderDish{}}

  """
  def change_order_dish(%OrderDish{} = order_dish, attrs \\ %{}) do
    OrderDish.changeset(order_dish, attrs)
  end
end
