class Cadre < ActiveRecord::Base
	#default_scope { where("cadres.id != ? ", -1)}
	has_many :alignes#, -> {where.not(id: Aligne.where("achat_id = ?", 5))}
	has_many :prestationlignes
	has_many :ventelignes
	has_many :achats, through: :alignes
	has_many :ventes, through: :ventelignes
end
