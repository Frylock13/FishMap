class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :place, index: true, foreign_key: true
      t.string :name
      t.text :review
      t.float :rating

      t.timestamps null: false
    end
  end
end
