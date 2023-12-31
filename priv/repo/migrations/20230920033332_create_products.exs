defmodule FoodOrder.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    up = "CREATE TYPE sizes as ENUM('SMALL', 'MEDIUM', 'LARGE')"
    down = "DROP TYPE sizes"
    execute(up, down)

    create table(:products, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :image_url, :string
      add :price, :integer
      add :size, :sizes, default: "SMALL", null: false
      add :description, :text

      timestamps()
    end
  end
end
