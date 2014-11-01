class PrestationAttachment < ActiveRecord::Base
	mount_uploader :photo, PhotoUploader
	belongs_to :prestation
end
