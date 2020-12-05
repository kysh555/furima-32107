FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.email}
    password              {"aaa111"}
    password_confirmation {password}
    nickname              {Faker::Name.name}
    family_name           {"名字"}
    first_name            {"名前"}
    family_name_kana      {"ミョウジ"}
    first_name_kana       {"ナマエ"}
    birthday              {Faker::Date.backward}
  end
  
end