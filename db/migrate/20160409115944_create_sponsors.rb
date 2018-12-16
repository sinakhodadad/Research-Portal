class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :sponsors, :name, unique: true
  end
end
