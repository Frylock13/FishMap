class AddAttachmentImageToPlaceImages < ActiveRecord::Migration
  def self.up
    change_table :place_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :place_images, :image
  end
end
