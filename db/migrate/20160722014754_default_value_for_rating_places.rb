class DefaultValueForRatingPlaces < ActiveRecord::Migration
  def change
    change_column :places, :rating, :float, default: 0
  end
end
