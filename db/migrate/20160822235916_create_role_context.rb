class CreateRoleContext < ActiveRecord::Migration
    def change
        create_table :role_contexts do |t|
            t.references :role
            t.references :context
        end

        add_index(:role_contexts, [:role_id, :context_id])
    end
end
