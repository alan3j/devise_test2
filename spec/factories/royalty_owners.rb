# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :royalty_owner do
    publishing_house_id 1
    type ""
    first_name "MyString"
    last_name "MyString"
    other_name "MyString"
    phone "MyString"
    fax "MyString"
    address "MyString"
    address2 "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
  end
end
