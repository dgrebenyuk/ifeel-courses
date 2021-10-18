# frozen_string_literal: true

if User.count.zero?
  10.times do
    User.create({
                  first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  email: Faker::Internet.email
                })
  end
end

if Device.count.zero?
  10.times do
    Device.create({
                    address: Faker::Internet.ip_v4_address,
                    vendor: Faker::Device.manufacturer
                  })
  end
end
