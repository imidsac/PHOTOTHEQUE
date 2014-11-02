class Client < ActiveRecord::Base
  has_many :ventes
  has_many :paiements, through: :ventes

end
