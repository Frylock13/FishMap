class RemoveColumnsFromPlace < ActiveRecord::Migration
  def change
    remove_column :places, :image1_file_name, :string
    remove_column :places, :image1_content_type, :string
    remove_column :places, :image1_file_size, :string
    remove_column :places, :image1_updated_at, :string
    remove_column :places, :image2_file_name, :string
    remove_column :places, :image2_content_type, :string
    remove_column :places, :image2_file_size, :string
    remove_column :places, :image2_updated_at, :string
    remove_column :places, :image3_file_name, :string
    remove_column :places, :image3_content_type, :string
    remove_column :places, :image3_file_size, :string
    remove_column :places, :image3_updated_at, :string
  end
end
