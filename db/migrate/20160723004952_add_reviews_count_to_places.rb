class AddReviewsCountToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :reviews_count, :integer, default: 0
  end
end
