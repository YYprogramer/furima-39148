FactoryBot.define do
  factory :user do
    nickname {'ニックネーム'}
    email {'test@test.com'}
    password {'abc123'}
    password_confirmation {'abc123'}
    family_name_kanji {'亜'}
    given_name_kanji {'亜'}
    family_name_kana {'ア'}
    given_name_kana {'ア'}
    birthday {'2000-01-01'}
  end
end
