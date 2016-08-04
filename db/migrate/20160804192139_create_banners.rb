class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.text :body
      t.string :width
      t.string :height
      t.string :left
      t.string :top
      t.boolean :active, default: false

      t.timestamps null: false
    end
  end
end
