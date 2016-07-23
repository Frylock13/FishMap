class AddAttachmentMarkerImageToCategories < ActiveRecord::Migration
  def self.up
    change_table :categories do |t|
      t.attachment :marker_image
    end
  end

  def self.down
    remove_attachment :categories, :marker_image
  end
end
