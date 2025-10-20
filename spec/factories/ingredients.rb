FactoryBot.define do
  factory :ingredient do
    recipe { nil }
    name { "MyString" }
    amount { 1 }
  end
end
