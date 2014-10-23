# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vente do
    boutique nil
    client nil
    clients "MyString"
    date_vente "2014-10-23 17:28:32"
    etat_vente "MyString"
    somme "9.99"
    payee "9.99"
    type ""
    etat_vente "MyString"
  end
end
