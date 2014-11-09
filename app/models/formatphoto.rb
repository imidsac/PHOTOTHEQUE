class Formatphoto < ActiveRecord::Base
	#default_scope { where("id != ? ", -1)}
	has_many :prestationlignes
end
