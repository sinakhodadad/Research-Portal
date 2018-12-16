class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :goal
      t.date :start_date
      t.date :end_time
      t.integer :sponsor_id

      t.timestamps null: false
    end
    add_index :projects, :title, unique: true
  end
end
