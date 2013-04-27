# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :royaltyowner_product_map do
    royalty_owner_id 1
    product_id 1
    royalty_percentage "9.99"
    royalty_type "MyString"
    amount "9.99"
    incomplete_ammount "9.99"
    notes "MyText"
  end
end
