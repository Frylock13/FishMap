class CreateComplains < ActiveRecord::Migration
  def change
    create_table :complains do |t|
      t.references :complainable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
