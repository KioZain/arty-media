class AddSecretToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :secret, :string
  end
end
