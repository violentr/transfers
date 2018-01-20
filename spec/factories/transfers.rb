FactoryBot.define do
  factory :transfer do
     account_number_from Faker::Bank.iban("be")
     account_number_to Faker::Bank.iban("be")
     amount_pennies 0
     country_code_from Faker::Address.country_code_long
     country_code_to Faker::Address.country_code_long
  end
end
