defmodule FoodOrder.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  @sizes ~w/SMALL MEDIUM LARGE/a
  @required  [:name, :price, :size, :description, :image_url]
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "products" do
    field :description, :string
    field :name, :string
    field :image_url, :string
    field :price, Money.Ecto.Amount.Type
    field :size, Ecto.Enum, values: @sizes, default: :SMALL

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, @required)
    |> validate_required(@required)
  end
end
