class DrderAddress
  inclede ActiveModel::Model
  attr_accesser :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\Z/, message: "is invalid. Enter it as follow(123-4567)"}
    validates :city
    validates :block
  end
  
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :phone_number, numericarity: {only_integer: true},format: /\A\d{10,11}\z/

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end

end