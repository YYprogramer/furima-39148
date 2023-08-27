require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品購入が成功する場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@order_form).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order_form.building = ''
        expect(@order_form).to be_valid
      end
    end

    context '商品購入が失敗する場合' do
      it'item_idがない場合は保存できない'do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors[:item_id]).to include("can't be blank")
      end
      it'user_idがない場合は保存できない'do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors[:user_id]).to include("can't be blank")
      end
      it 'postal_codeが空の場合、保存できない' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form).to_not be_valid
      end
      it 'postal_codeが「3文字-4文字」ではない場合、保存できない' do
        @order_form.postal_code = '1111-111'
        @order_form.valid?
        expect(@order_form).to_not be_valid
      end
      it 'postal_codeに「-」がない場合、保存できない' do
        @order_form.postal_code = '1111111'
        @order_form.valid?
        expect(@order_form).to_not be_valid
      end
      it 'postal_codeに全角数字が含まれている場合、保存できない' do
        @order_form.postal_code = '１11-1111'
        @order_form.valid?
        expect(@order_form).to_not be_valid
      end
      it 'send_origin_idの値が１の場合、保存できない' do
        @order_form.send_origin_id = '1'
        @order_form.valid?
        expect(@order_form).to_not be_valid
      end
      it 'cityが空の場合、保存できない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form).to_not be_valid
      end
      it 'street_addressが空の場合、保存できない' do
        @order_form.street_address = ''
        @order_form.valid?
        expect(@order_form).to_not be_valid
      end
      it 'phone_numberが空の場合、保存できない' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form).to_not be_valid
      end
      it 'phone_numberが10桁以下の場合、保存できない' do
        @order_form.phone_number = '090123456'
        @order_form.valid?
        expect(@order_form).to_not be_valid
      end
      it 'phone_numberが11桁以上の場合、保存できない' do
        @order_form.phone_number = '090123456789'
        @order_form.valid?
        expect(@order_form).to_not be_valid
      end
      it 'phone_numberに全角数字が含まれていた場合、保存できない' do
        @order_form.phone_number = '０9012345678'
        @order_form.valid?
        expect(@order_form).to_not be_valid
      end
      it 'tokenが空の場合、保存できない' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form).to_not be_valid
      end
    end
  end
end
