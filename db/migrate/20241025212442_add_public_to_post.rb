class AddPublicToPost < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :public, :boolean, default: false
  end
end
