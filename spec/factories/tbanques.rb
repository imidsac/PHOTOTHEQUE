# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tbanque do
    banque nil
    type_rv "MyString"
    montant "9.99"
    porteur "MyString"
  end
end
