class AddRatingToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :rating, :float
  end
end
