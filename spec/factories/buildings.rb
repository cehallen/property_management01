# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
    street_address "22 Washington St"
    city "Miami"
    state "FL"
    postal_code 34812
    association :owner, factory: :owner
  end
end
