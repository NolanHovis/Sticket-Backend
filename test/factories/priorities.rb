FactoryBot.define do
  factory :priority do
    label { "MyString" }
    string { "MyString" }
    sort_order { 1 }
    references { "" }
  end
end
