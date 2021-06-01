defmodule Califa.OrdersTest do
  use Califa.DataCase

  alias Califa.Orders

  describe "order_status" do
    alias Califa.Orders.OrderStatus

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def order_status_fixture(attrs \\ %{}) do
      {:ok, order_status} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Orders.create_order_status()

      order_status
    end

    test "list_order_status/0 returns all order_status" do
      order_status = order_status_fixture()
      assert Orders.list_order_status() == [order_status]
    end

    test "get_order_status!/1 returns the order_status with given id" do
      order_status = order_status_fixture()
      assert Orders.get_order_status!(order_status.id) == order_status
    end

    test "create_order_status/1 with valid data creates a order_status" do
      assert {:ok, %OrderStatus{} = order_status} = Orders.create_order_status(@valid_attrs)
      assert order_status.name == "some name"
    end

    test "create_order_status/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Orders.create_order_status(@invalid_attrs)
    end

    test "update_order_status/2 with valid data updates the order_status" do
      order_status = order_status_fixture()
      assert {:ok, %OrderStatus{} = order_status} = Orders.update_order_status(order_status, @update_attrs)
      assert order_status.name == "some updated name"
    end

    test "update_order_status/2 with invalid data returns error changeset" do
      order_status = order_status_fixture()
      assert {:error, %Ecto.Changeset{}} = Orders.update_order_status(order_status, @invalid_attrs)
      assert order_status == Orders.get_order_status!(order_status.id)
    end

    test "delete_order_status/1 deletes the order_status" do
      order_status = order_status_fixture()
      assert {:ok, %OrderStatus{}} = Orders.delete_order_status(order_status)
      assert_raise Ecto.NoResultsError, fn -> Orders.get_order_status!(order_status.id) end
    end

    test "change_order_status/1 returns a order_status changeset" do
      order_status = order_status_fixture()
      assert %Ecto.Changeset{} = Orders.change_order_status(order_status)
    end
  end

  describe "orders" do
    alias Califa.Orders.Order

    @valid_attrs %{total: 42}
    @update_attrs %{total: 43}
    @invalid_attrs %{total: nil}

    def order_fixture(attrs \\ %{}) do
      {:ok, order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Orders.create_order()

      order
    end

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Orders.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Orders.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      assert {:ok, %Order{} = order} = Orders.create_order(@valid_attrs)
      assert order.total == 42
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Orders.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      assert {:ok, %Order{} = order} = Orders.update_order(order, @update_attrs)
      assert order.total == 43
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Orders.update_order(order, @invalid_attrs)
      assert order == Orders.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Orders.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Orders.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Orders.change_order(order)
    end
  end
end
