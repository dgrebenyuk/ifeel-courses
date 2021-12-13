FactoryBot.define do
  factory :profile do
    user
    phone_number { Faker::PhoneNumber.cell_phone_in_e164 }
  end
end
