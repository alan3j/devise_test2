# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :publishing_house do
    type ""
    name "MyString"
    contact_name "MyString"
    phone "MyString"
    fax "MyString"
    address "MyString"
    address2 "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
  end
end
