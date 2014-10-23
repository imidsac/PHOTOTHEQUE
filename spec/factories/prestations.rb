# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :prestation do
    client nil
    employe nil
    date_perstation "2014-10-23 17:27:45"
    etat_prestation "MyString"
    somme "9.99"
    payee "9.99"
  end
end
