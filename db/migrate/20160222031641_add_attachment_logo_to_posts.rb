class AddAttachmentLogoToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :posts, :logo
  end
end
