class AddPublicToCollection < ActiveRecord::Migration[7.2]
  def change
    add_column :collections, :public, :boolean, default: false
  end
end
