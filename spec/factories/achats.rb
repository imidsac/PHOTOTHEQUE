# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :achat do
    fournisseur nil
    date_achat "2014-10-23 17:26:28"
    type ""
    somme "9.99"
    payee "9.99"
    etat_achat "MyString"
  end
end
