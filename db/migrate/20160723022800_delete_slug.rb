class DeleteSlug < ActiveRecord::Migration
  def change
    remove_column :categories, :slug
  end
end
