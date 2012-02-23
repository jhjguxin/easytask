class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :finished ,:default=>false

      t.timestamps
    end
  end
end
