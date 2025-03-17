FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.unique.email }
    # ランダムで生成する際、英数字になるよう'1a'追加
    password { '1a' + Faker::Internet.unique.password(min_length: 6) }
    password_confirmation { password }
    last_name { '斉藤' }
    first_name { '正憲' }
    last_name_kana { 'サイトウ' }
    first_name_kana { 'マサノリ' }
    birthday { Faker::Date.birthday }
  end
end
