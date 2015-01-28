class Client < ActiveRecord::Base
	has_many :ventes, dependent: :destroy
	has_many :paiements, dependent: :destroy


  scope :tout, -> { where("id != ?", -1).order(:type_cl) }
  scope :detaillant, -> { where("id != ? and type_cl = ?", -1, 'o').order(:nom) }
  scope :grossiste, -> { where("id != ? and type_cl = ?", -1, 'g').order(:nom) }

end
