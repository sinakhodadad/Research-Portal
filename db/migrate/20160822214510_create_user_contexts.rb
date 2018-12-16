class CreateUserContexts < ActiveRecord::Migration
    def change
        create_table :user_contexts do |t|
            t.string :value
            t.references :context
            t.references :user

            t.timestamps null: false
        end
    end
end
