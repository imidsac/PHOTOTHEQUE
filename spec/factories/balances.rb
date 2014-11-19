# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :balance do
    exercice 1
    mois 1
    achats "9.99"
    depenses "9.99"
    ventes "9.99"
    tva "9.99"
  end
end
