class Article < ActiveRecord::Base
	#default_scope { where("articles.id != ? ", -1)}
	has_many :alignes#, -> { where.not(id: Aligne.where("achat_id = ?", achat_id))}
	has_many :ventelignes
	has_many :achats, through: :alignes
	has_many :ventes, through: :ventelignes
	
end
