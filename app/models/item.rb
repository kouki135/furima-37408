class Item < ApplicationRecord
  validates :product_name, presence: true
  validates :product_explanation, presence: true
  validates :product_category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :product_condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_side_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_source_area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_days_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: /\d/
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image
  has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_category, :product_condition, :delivery_charge_side, :delivery_source_area, :delivery_days
end