class AddShowInUiToRole < ActiveRecord::Migration
  def change
    add_column :roles, :show_in_ui, :boolean
  end
end
