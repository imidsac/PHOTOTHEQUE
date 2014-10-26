class Fournisseur < ActiveRecord::Base
	has_many :achats
	accepts_nested_attributes_for :achats
end
