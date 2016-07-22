class AddActiveToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :active, :boolean, default: false
  end
end
