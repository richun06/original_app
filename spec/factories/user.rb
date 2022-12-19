FactoryBot.define do
  factory :user do
    name { "テスト太郎" }
    email { "test_taro@sample.com" }
    password { "111111" }
    phone_number { "09022223333" }
    postcode { 8801234 }
    admin { "true" }
  end

  factory :second_user, class: User do
    name { "テスト花子" }
    email { "test_hanako@sample.com" }
    password { "111111" }
    phone_number { "09022223333" }
    postcode { 8801234 }
    admin { "false" }
  end

  factory :admin_user, class: User do
    name { "テスト管理者" }
    email { "test_kanrisya@sample.com" }
    password { "111111" }
    phone_number { "09022223333" }
    postcode { 8801234 }
    admin { "true" }
  end
end