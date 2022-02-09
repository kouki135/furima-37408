class Item < ApplicationRecord
  validates :product_name, presence: true
  validates :product_explanation, presence: true
  validates :product_category_id, presence: true
  validates :product_condition_id, presence: true
  validates :delivery_charge_side_id, presence: true
  validates :delivery_source_area_id, presence: true
  validates :delivery_days_id, presence: true
  validates :price, presence: true
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image
end
