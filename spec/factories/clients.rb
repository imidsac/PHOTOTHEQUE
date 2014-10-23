# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client do
    nom "MyString"
    prenom "MyString"
    phone "MyString"
    address "MyText"
    email "MyString"
  end
end
