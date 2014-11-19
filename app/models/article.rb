class Article < ActiveRecord::Base
	#default_scope { where("articles.id != ? ", -1)}
	has_many :alignes, -> {order('articles.name DESC')}
	has_many :ventelignes
	has_many :achats, through: :alignes
	has_many :ventes, through: :ventelignes
	
end
