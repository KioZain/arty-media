class AddDetailsToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :amount, :integer
    add_column :posts, :city, :string
    add_column :posts, :price, :integer
  end
end
