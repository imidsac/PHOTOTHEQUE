# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tcaiss, :class => 'Tcaisse' do
    date_tc "2014-10-23 17:31:29"
    crencier "MyString"
    type ""
  end
end
