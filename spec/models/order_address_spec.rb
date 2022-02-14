require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '配送先情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '配送先情報が保存できる時' do
      it 'postcode,prefecture_id,city,block,building,phone_number,tokenが存在すれば保存できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end
    context '配送先情報が保存できない時' do
      it 'postcodeが空では登録できない' do
        @order_address.postcode = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeは3桁ハイフン4桁の半角文字列でないと登録できない' do
        @order_address.postcode = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postcode is invalid. Enter it as follow(123-4567)')
      end
      it 'prefecture_idが1では登録できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空では登録できない' do
        @order_address.block = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは10桁以上11桁以内の半角数値でないと登録できない' do
        @order_address.phone_number = '１２３４５６７８９'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is not a number')
      end
      it 'postcodeが空では登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
