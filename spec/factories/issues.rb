FactoryBot.define do
  factory :issue do
    message { Faker::Lorem.sentence }
    is_done { [true, false].sample }
    user
  end
end
