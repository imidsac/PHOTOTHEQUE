# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :livraisonlog do
    date_liv "2015-01-29 22:34:11"
    achat nil
    produit nil
    qte "9.99"
    vente nil
    etat "MyString"
    user nil
  end
end
