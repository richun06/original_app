FactoryBot.define do
  factory :health do
    responsibility { "野原" }
    record_in_at { "2022-10-01" }
  end

  factory :second_health, class: Health do
    responsibility { "風間" }
    record_in_at { "2022-11-05" }
  end

  factory :third_health, class: Health do
    responsibility { "大原" }
    record_in_at { "2022-12-05" }
  end

end