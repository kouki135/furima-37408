class Order < ApplicationRecord
  # 商品購入機能実施時に実行 belongs_to :user
  belongs_to :item
end
