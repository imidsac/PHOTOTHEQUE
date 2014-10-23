# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :prestationligne do
    prestation nil
    qte "9.99"
    qtelivre "9.99"
    montant "9.99"
    numero_prise 1
    type false
    etat "MyString"
  end
end
