FactoryBot.define do
  factory :care_user do
    name { "おじいちゃん" }
    birthday { "1960-01-01" }
    age { 80 }
    sex { "男" }
    user_id { 1 }
    availability { 'あり' }
    division { '通所' }
  end

  factory :second_care_user, class: CareUser do
    name { "おばあちゃん" }
    birthday { "1960-01-01" }
    age { 80 }
    sex { "女" }
    availability { 'なし' }
    division { 'S宿泊' }
  end

  factory :third_care_user, class: CareUser do
    name { "はなこ" }
    birthday { "1960-01-01" }
    age { 90 }
    sex { "男" }
  end

end