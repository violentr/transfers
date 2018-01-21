FactoryBot.define do
  factory :user do
   first_name  Faker::Name.first_name
   last_name Faker::Name.last_name
   address_line_1 Faker::Address.street_address
   dob Faker::Date.birthday(18, 65)
   sequence(:username) {|u| "username_#{u}" }
   sequence(:email) {|e| "email_user#{e}@example.com"}
   password 'password'
   password_confirmation 'password'
  end
end
