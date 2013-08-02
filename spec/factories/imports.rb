# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :import do
    file_name "MyString"
    file_size "MyString"
    file_hash "MyString"
    file_items 1
    file_type "MyString"
  end
end
