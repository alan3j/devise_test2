# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    title "MyText"
    artist_id 1
    category_id 1
    upc "MyString"
    spcn "MyString"
    price "9.99"
    media_type "MyString"
    new_release false
    key1 "MyString"
    key2 "MyString"
    key3 "MyString"
    rank 1
    old_price "9.99"
    new_price "9.99"
  end
end
