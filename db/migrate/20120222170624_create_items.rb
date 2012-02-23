class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :count
      t.integer :task_id
      t.boolean :finished ,:default=>false
      t.timestamps
    end
    add_index :items, :task_id
  end
end
