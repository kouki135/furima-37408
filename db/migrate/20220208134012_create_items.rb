class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name, null: false
      t.text :product_explanation, null: false
      t.integer :product_category_id, null: false
      t.integer :product_condition_id, null: false
      t.integer :delivery_charge_side_id, null: false
      t.integer :delivery_source_area_id, null: false
      t.integer :delivery_days_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
