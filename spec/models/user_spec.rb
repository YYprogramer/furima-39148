require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it 'nicknameが空では保存できない' do
      user = User.new(nickname: '', email: 'test@example.com', password: 'abc000', password_confirmation: 'abc000', family_name_kanji: '実験', given_name_kanji: '実験', family_name_kana: 'ジッケン', given_name_kana: 'ジッケン', birthday:'1930-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では保存できない' do
      user = User.new(nickname: 'test', email: '', password: 'abc000', password_confirmation: 'abc000', family_name_kanji: '実験', given_name_kanji: '実験', family_name_kana: 'ジッケン', given_name_kana: 'ジッケン', birthday:'1930-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では保存できない' do
      user = User.new(nickname: 'test', email: 'test@example.com', password: '', password_confirmation: 'abc000', family_name_kanji: '実験', given_name_kanji: '実験', family_name_kana: 'ジッケン', given_name_kana: 'ジッケン', birthday:'1930-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致だと登録できない' do
      @user.password = 'abc123'
      @user.password_confirmation = 'abc124'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
