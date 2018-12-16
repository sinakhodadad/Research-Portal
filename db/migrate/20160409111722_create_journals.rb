class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :journals, :name, unique: true
  end
end
