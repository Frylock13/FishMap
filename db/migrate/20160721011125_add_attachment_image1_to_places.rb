class AddAttachmentImage1ToPlaces < ActiveRecord::Migration
  def self.up
    change_table :places do |t|
      t.attachment :image1
    end
  end

  def self.down
    remove_attachment :places, :image1
  end
end
