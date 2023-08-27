require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @order = FactoryBot.build(:order)
  end

  describe '商品購入（オーダーテーブル）' do
    context '商品購入が成功する場合' do
      it 'item_id,user_idがあれば保存できる' do
        expect(@order).to be_valid
      end
    end

    context '商品購入が失敗する場合' do
      it 'item_idがない場合は保存できない' do
        @order.item = nil
        @order.valid?
        expect(@order.errors[:item]).to include('must exist')
      end

      it 'user_idがない場合は保存できない' do
        @order.user = nil
        @order.valid?
        expect(@order.errors[:user]).to include('must exist')
      end
    end
  end
end
