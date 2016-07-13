class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :title
      t.references :category, index: true, foreign_key: true
      t.references :city, index: true, foreign_key: true
      t.text :address
      t.text :description
      t.integer :visits
      t.integer :user_id
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
