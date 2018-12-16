class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :title
      t.integer :year
      t.integer :page
      t.integer :volume
      t.references :journal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
