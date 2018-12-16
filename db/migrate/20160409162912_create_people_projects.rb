class CreatePeopleProjects < ActiveRecord::Migration
  def change
    create_table :people_projects , id: false do |t|
      t.references :user, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
