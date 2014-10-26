class Article < ActiveRecord::Base
	has_many :alignes
	has_many :achats, through: :alignes
end
