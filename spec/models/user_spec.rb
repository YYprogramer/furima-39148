require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では保存できない' do
      user = User.new(nickname: '', email: 'test@example.com', password: 'abc000', password_confirmation: 'abc000')
    end
    it 'emailが空では保存できない' do
      
    end
  end
end
