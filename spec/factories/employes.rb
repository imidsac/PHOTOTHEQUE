# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employe do
    nom "MyString"
    prenom "MyString"
    sexe "MyString"
    phone "MyString"
    address "MyText"
    email "MyString"
    compte_banc "MyString"
    salaireb "9.99"
    type ""
    date_recru "2014-10-23"
  end
end
