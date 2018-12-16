class AddUniqUserAndProjectTogether < ActiveRecord::Migration
    def change
        add_index :people_projects, [:user_id,:project_id] , :unique => true
    end
end
