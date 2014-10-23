# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :caiss, :class => 'Caisse' do
    paiement "9.99"
    font "9.99"
  end
end
