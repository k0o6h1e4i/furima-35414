FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'s0w6a1g4'}
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"太郎"}
    last_kana             {"ヤマダ"}
    first_kana            {"タロウ"}
    birthday              {"1996-09-10"}
  end
end