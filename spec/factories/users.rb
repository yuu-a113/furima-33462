FactoryBot.define do

  Faker::Config.locale = :ja

  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name{Faker::Name.first_name}
    last_name{Faker::Name.last_name}
    first_name_kana{Faker::Name.last_name_kana}
    last_name_kana{Faker::Name.last_name_kana}
    bday{Faker::Date.birthday}
  end
end