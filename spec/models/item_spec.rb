require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録機能' do
    context '商品出品登録できる時' do
      it 'image、product_name、product_explanation、product_category_id、product_condition_id、delivery_charge_side_id、delivery_source_area_id、delivery_days_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品登録できない時' do
      it 'imageが空では登録できない' do
      end
      it 'product_nameが空では登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it 'product_explanationが空では登録できない' do
        @item.product_explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product explanation can't be blank")
      end
      it 'product_category_idが1では登録できない' do
        @item.product_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product category can't be blank")
      end
      it 'product_condition_idが1では登録できない' do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end
      it 'delivery_charge_side_idが1では登録できない' do
        @item.delivery_charge_side_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge side can't be blank")
      end
      it 'delivery_source_area_idが1では登録できない' do
        @item.delivery_source_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery source area can't be blank")
      end
      it 'delivery_days_idが1では登録できない' do
        @item.delivery_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceは半角数字でないと登録できない' do
        @item.price = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが300未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが9999999より大きいと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
