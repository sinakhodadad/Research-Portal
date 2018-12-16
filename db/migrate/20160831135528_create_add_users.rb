class CreateAddUsers < ActiveRecord::Migration
  def change
    create_table :add_users do |t|
      t.string :email
      t.string :name
      t.string :family
      t.string :role

      t.timestamps null: false
    end
  end
end
