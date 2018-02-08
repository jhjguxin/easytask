class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :finished ,:default=>false

      t.timestamps
    end
  end
end
