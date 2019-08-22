class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.integer :value
      t.string :brand
      t.belongs_to :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end