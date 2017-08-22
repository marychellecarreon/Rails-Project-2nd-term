class AddAttachmentAvatarToMilks < ActiveRecord::Migration
  def self.up
    change_table :milks do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :milks, :avatar
  end
end
