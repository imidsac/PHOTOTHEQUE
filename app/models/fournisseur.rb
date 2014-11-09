class Fournisseur < ActiveRecord::Base
	#default_scope { where("fournisseurs.id != ? ", -1)}
  	has_many :paiements, through: :achats
	has_many :achats
	accepts_nested_attributes_for :achats
end
