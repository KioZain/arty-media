class AddUserIdToCollections < ActiveRecord::Migration[7.2]
  def change
    add_column :collections, :user_id, :integer
  end
end