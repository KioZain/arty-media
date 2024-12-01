class AddPlacedToProfiles < ActiveRecord::Migration[7.2]
  def change
    add_column :profiles, :placed, :text
  end
end
