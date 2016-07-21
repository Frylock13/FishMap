class AddAttachmentImage3ToPlaces < ActiveRecord::Migration
  def self.up
    change_table :places do |t|
      t.attachment :image3
    end
  end

  def self.down
    remove_attachment :places, :image3
  end
end
