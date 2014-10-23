# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :aligne do
    achat nil
    qte "9.99"
    qtelivre "9.99"
    montant "9.99"
    etat "MyString"
  end
end
