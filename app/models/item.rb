class Item < ApplicationRecord
  validates :nickname, presence: true
  
  belongs_to :user
end
