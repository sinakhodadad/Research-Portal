class CreateContexts < ActiveRecord::Migration
    def change
        create_table(:contexts) do |t|
            t.string :name
            t.string :value_type
            t.string :location
            t.references :role

            t.timestamps null: false
        end
        add_index :contexts, :name, :unique => true
    end
end
