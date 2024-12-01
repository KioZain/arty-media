class RenameTypeInDisplays < ActiveRecord::Migration[7.2]
  def change
    rename_column :displays, :type, :display_type
  end
end
