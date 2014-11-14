class Client < ActiveRecord::Base
	#default_scope { where("clients.id != ? ", -1)}
	has_many :ventes
	has_many :paiements
  	has_many :paiements#, through: :ventes
  	#has_many :paiements, through: :prestations

end
