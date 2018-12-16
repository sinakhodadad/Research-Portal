class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.integer :userid
      t.text :post

      t.timestamps null: false
    end
  end
end
