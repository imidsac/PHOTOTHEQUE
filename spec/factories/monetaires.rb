# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :monetaire do
    money "MyString"
    code_money "MyString"
    valeur "9.99"
  end
end
