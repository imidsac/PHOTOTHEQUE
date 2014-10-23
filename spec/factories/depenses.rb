# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :depense do
    description "MyString"
    categoriedep nil
    montant "MyString"
    etat_dep "MyString"
  end
end
