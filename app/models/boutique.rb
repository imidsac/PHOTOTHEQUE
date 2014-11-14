class Boutique < ActiveRecord::Base
	has_many :ventes
	has_many :paiements
	
end
