# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :retourelog do
    date_re "2015-01-29 22:35:57"
    produit nil
    qte "9.99"
    optionretoure nil
    achat nil
    vente nil
    motif "MyString"
    user nil
  end
end
