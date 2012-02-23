class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :username
      t.string :url
      t.integer :item_id
      t.timestamps
    end
    add_index :assets, :item_id
  end
end
