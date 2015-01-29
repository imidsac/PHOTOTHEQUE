class Article < ActiveRecord::Base
	#default_scope { where("articles.id != ? ", -1)}
	default_scope { where("articles.id != ? ", -1).order(:name, :reference)}
	belongs_to :fournisseur
	has_many :alignes
	has_many :ventelignes
	has_many :achats, through: :alignes
	has_many :ventes, through: :ventelignes
	
end
