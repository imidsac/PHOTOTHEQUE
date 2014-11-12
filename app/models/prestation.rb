class Prestation < ActiveRecord::Base
	#default_scope { where("client_id = ? ", -1)}
  belongs_to :client
  belongs_to :employe
  has_many :paiements, dependent: :destroy
  has_many :prestationlignes, dependent: :destroy
  accepts_nested_attributes_for :prestationlignes
  has_many :prestation_attachments, dependent: :destroy
  #has_many :paiements, through: :clients, dependent: :destroy
  accepts_nested_attributes_for :prestation_attachments
end
