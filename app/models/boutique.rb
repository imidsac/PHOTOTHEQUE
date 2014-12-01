class Boutique < ActiveRecord::Base
	has_many :ventes, dependent: :destroy
	has_many :paiements, dependent: :destroy
	
end
