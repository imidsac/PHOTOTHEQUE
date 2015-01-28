class Banque < ActiveRecord::Base
  has_many :tbanques, dependent: :destroy
  has_many :paiements, dependent: :destroy
  scope :caisse, -> { where("id = ? ", -1) }
  scope :compte_banc, -> { where("id != ? ", -1) }
end
