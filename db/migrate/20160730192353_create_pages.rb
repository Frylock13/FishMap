class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :slug
      t.string :title
      t.boolean :active, default: false
      t.text :body
      t.text :seo_title
      t.text :seo_description
      t.text :seo_keywords

      t.timestamps null: false
    end
  end
end
