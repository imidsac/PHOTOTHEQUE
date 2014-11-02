class Cadre < ActiveRecord::Base
	has_many :alignes#, -> {where.not(id: Aligne.where("achat_id = ?", 5))}
	has_many :prestationlignes
	has_many :ventelignes
	has_many :achats, through: :alignes
	has_many :ventes, through: :ventelignes
end
