# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :owner do
    first_name "John"
    last_name "Smith"
    email "JS@gmail.com"
    company_name "Tugs Inc."
  end
end
