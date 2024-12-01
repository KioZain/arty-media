class CreateDisplays < ActiveRecord::Migration[7.2]
  def change
    create_table :displays do |t|
      t.references :post, null: false, foreign_key: true
      t.string :name
      t.string :year
      t.string :type
      t.string :link

      t.timestamps
    end
  end
end
