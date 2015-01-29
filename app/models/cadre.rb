class Cadre < ActiveRecord::Base
	#default_scope { where("cadres.id != ? ", -1)}
	default_scope {where("cadres.id != ? ", -1).order(:numerobaguete)}
	belongs_to :fournisseur
	has_many :alignes
	has_many :prestationlignes
	has_many :ventelignes
	has_many :achats, through: :alignes
	has_many :ventes, through: :ventelignes
end
