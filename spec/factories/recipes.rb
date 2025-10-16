FactoryBot.define do
  factory :recipe do
    user { nil }
    category { nil }
    title { "MyString" }
    description { "MyText" }
    cooking_time { 1 }
    difficulty { "MyString" }
    published { false }
  end
end
