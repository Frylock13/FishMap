class RemoveColumnsFromPlaces < ActiveRecord::Migration
  def change
    remove_column :places, :city_id, :string
    remove_column :places, :address, :string
  end
end
