defmodule FoodOrderWeb.PageLive do
  use FoodOrderWeb, :live_view

  alias FoodOrderWeb.PageLive.Item
  alias FoodOrder.Products

  def mount(_, _, socket) do
    {:ok, assign(socket, :products, Products.list_products())}
  end
end
