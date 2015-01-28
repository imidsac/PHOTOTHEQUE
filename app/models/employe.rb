class Employe < ActiveRecord::Base
	#default_scope { where("employes.id != ? ", -1)}
	has_many :depenses

end
