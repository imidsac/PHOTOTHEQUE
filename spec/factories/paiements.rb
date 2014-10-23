# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :paiement do
    vente nil
    client nil
    achat nil
    fournisseur nil
    datepaiement "2014-10-23 17:29:13"
    motif "MyString"
    montant "9.99"
  end
end
