# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :venteligne do
    vente nil
    qte "9.99"
    qtelivre "9.99"
    montant "9.99"
    etat "MyString"
  end
end
