class Article < ActiveRecord::Base
	has_many :alignes
	has_many :ventelignes
	has_many :achats, through: :alignes
	has_many :ventes, through: :ventelignes
end
