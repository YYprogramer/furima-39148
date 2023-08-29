FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname { Faker::Name.unique.first_name }
    email { Faker::Internet.unique.email }
    password { 'abc123' }
    password_confirmation { password }
    family_name_kanji { person.first.kanji }
    given_name_kanji { person.last.kanji }
    family_name_kana { person.first.katakana }
    given_name_kana { person.last.katakana }
    birthday { Faker::Date.between(from: '1980-01-01', to: '2022-12-31') }
  end
end
