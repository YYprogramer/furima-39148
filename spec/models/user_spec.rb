require 'rails_helper'

RSpec.describe User, type: :model do
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
  end
end
