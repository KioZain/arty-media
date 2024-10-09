class CreateJoinTableCollectionsPosts < ActiveRecord::Migration[7.2]
  def change
    create_join_table :collections, :posts do |t|
      t.index [ :collection_id, :post_id ]
      t.index [ :post_id, :collection_id ]
    end
  end
end
