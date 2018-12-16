class AddPageEndToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :pageend, :integer
  end
end
