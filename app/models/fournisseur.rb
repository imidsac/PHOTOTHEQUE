class Fournisseur < ActiveRecord::Base
	#default_scope { where("fournisseurs.id != ? ", -1)}
  	has_many :paiements#, through: :achats
  	has_many :achats
  	has_many :articles
  	has_many :cadres
  	accepts_nested_attributes_for :achats
  end
