class AddAttachmentAvatarToPublications < ActiveRecord::Migration
  def self.up
    change_table :publications do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :publications, :avatar
  end
end
