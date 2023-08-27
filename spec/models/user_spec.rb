require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく場合' do
      it 'nickname,email,password,password_confirmation,family_name_kanji,given_name_kanji,family_name_kana,family_name_kana,birthdayがあれば保存できる' do
        expect(@user).to be_valid
      end
      it 'passwordが小文字の英語と数字を含む6文字以上なら保存できる' do
        @user.password = 'abc123' 
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
      it 'family_name_kanjiが平仮名・カタカナ・漢字なら保存できる' do
        @user.family_name_kanji = 'あア亜'
        expect(@user).to be_valid
      end
      it 'given_name_kanjiが平仮名・カタカナ・漢字なら保存できる' do
        @user.given_name_kanji = 'あア亜'
        expect(@user).to be_valid
      end
      it 'family_name_kanaがカタカナなら保存できる' do
        @user.family_name_kana = 'ア'
        expect(@user).to be_valid
      end
      it 'given_name_kanaがカタカナなら保存できる' do
        @user.given_name_kana = 'ア'
        expect(@user).to be_valid
      end
    end
    
    context '新規登録がうまくいかない場合'do
      it 'nicknameが空では保存できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では保存できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では保存できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致だと登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc124'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下だと保存できない' do
        @user.password = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが英語のみだと保存できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが数字のみだと保存できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordに全角文字が含まれると保存できない' do
        @user.password = 'Ａbc123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it '重複したemailがある場合保存できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれていないと保存できない' do
        @user.email = 'abc.abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'family_name_kanjiが英語だと保存できない' do
        @user.family_name_kanji = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanji is invalid")
      end
      it 'given_name_kanjiが英語だと保存できない' do
        @user.given_name_kanji = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name kanji is invalid")
      end
      it 'family_name_kanaが漢字だと保存できない' do
        @user.family_name_kana = '亜'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end 
      it 'given_name_kanaが漢字だと保存できない' do
        @user.given_name_kana = '亜'
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name kana is invalid")
      end
      it 'family_name_kanjiが空だと保存できない' do
        @user.family_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanji is invalid")
      end
      it 'given_name_kanjiが空だと保存できない' do
        @user.given_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name kanji is invalid")
      end
      it 'family_name_kanjiに半角文字が含まれていると保存できない' do
        @user.family_name_kanji = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanji is invalid")
      end
      it 'given_name_kanjiに半角文字が含まれていると保存できない' do
        @user.given_name_kanji = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name kanji is invalid")
      end
      it 'family_name_kanaが空だと保存できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
      it 'given_name_kanaが空だと保存できない' do
        @user.given_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name kana is invalid")
      end
      
      it 'birthdayが空では保存できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
