class AddAttachmentImageToSnipits < ActiveRecord::Migration
  def self.up
    change_table :snipits do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :snipits, :image
  end
end
