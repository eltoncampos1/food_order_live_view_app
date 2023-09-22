defmodule FoodOrderWeb.Admin.ProductLive.IndexTest do
  use FoodOrderWeb.ConnCase

  import FoodOrder.ProductsFixtures
  import Phoenix.LiveViewTest

  describe "index" do
    setup [:create_product]

    test "list products", %{conn: conn, product: product} do
      {:ok, view, _html} = live(conn, ~p"/admin/products")

      table_row = "#products-#{product.id}>td>div>span"
      assert has_element?(view, "header>div>h1", "List Products")
      assert has_element?(view, "#products-#{product.id}")
      assert has_element?(view, table_row, product.name)
      assert has_element?(view, table_row, product.size |> to_string())
      assert has_element?(view, table_row, Money.to_string(product.price))
    end
  end

  def create_product(_) do
    product = product_fixture()

    %{product: product}
  end
end
