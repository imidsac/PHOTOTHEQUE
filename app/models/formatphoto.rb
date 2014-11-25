class Formatphoto < ActiveRecord::Base
	#default_scope { where("id != ? ", -1)}
	default_scope { order(:dimention)}
	has_many :prestationlignes
end
