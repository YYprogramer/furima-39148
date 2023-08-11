require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '新規登録がうまくいく場合' do
      it 'name,description,condition_id,send_cost_id,send_origin_id,send_time_id,category_id,price,user_id,imageがあれば保存できる' do
        @user = create(:user) 
        @item = build(:item, user: @user) 
        expect(@item).to be_valid
      end
    end
    context '新規登録がうまくいかない場合' do
      it 'nameが空だと保存できない' do
      @user = create(:user)
      @item = build(:item, user: @user, name: "")
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空だと保存できない'do
      @user = create(:user)
      @item = build(:item, user: @user, description: "")
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが1だと保存できない'do
      @user = create(:user)
      @item = build(:item, user: @user, category_id: "1")
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが1だと保存できない'do
      @user = create(:user)
      @item = build(:item, user: @user, condition_id: "1")
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'send_cost_idが1だと保存できない'do
      @user = create(:user)
      @item = build(:item, user: @user, send_cost_id: "1")
      @item.valid?
      expect(@item.errors.full_messages).to include("Send cost can't be blank")
      end
      it 'send_origin_idが1だと保存できない'do
      @user = create(:user)
      @item = build(:item, user: @user, send_origin_id: "1")
      @item.valid?
      expect(@item.errors.full_messages).to include("Send origin can't be blank")
      end
      it 'send_time_idが1だと保存できない'do
      @user = create(:user)
      @item = build(:item, user: @user, send_time_id: "1")
      @item.valid?
      expect(@item.errors.full_messages).to include("Send time can't be blank")
      end
      it 'priceが空だと保存できない'do
      @user = create(:user)
      @item = build(:item, user: @user, price: "")
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299円以下だと保存できない'do
      @user = create(:user)
      @item = build(:item, user: @user, price: "299")
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceが10,000,000円以上だと保存できない'do
      @user = create(:user)
      @item = build(:item, user: @user, price: "10000000")
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
      end
    end
  end 
end
