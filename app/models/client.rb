class Client < ActiveRecord::Base
	#default_scope { where("clients.id != ? ", -1)}
	has_many :ventes, dependent: :destroy
	has_many :paiements, dependent: :destroy
  	#has_many :paiements, through: :prestations

end
