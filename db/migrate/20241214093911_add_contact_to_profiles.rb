class AddContactToProfiles < ActiveRecord::Migration[7.2]
  def change
    add_column :profiles, :contact, :string
  end
end
