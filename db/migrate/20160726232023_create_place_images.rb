class CreatePlaceImages < ActiveRecord::Migration
  def change
    create_table :place_images do |t|
      t.integer :place_id
      t.timestamps null: false
    end

    add_index :place_images, :place_id
  end
end
