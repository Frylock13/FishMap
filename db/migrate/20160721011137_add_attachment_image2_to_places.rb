class AddAttachmentImage2ToPlaces < ActiveRecord::Migration
  def self.up
    change_table :places do |t|
      t.attachment :image2
    end
  end

  def self.down
    remove_attachment :places, :image2
  end
end
