class Vente < ActiveRecord::Base
  belongs_to :boutique
  belongs_to :client
  has_many :ventelignes
  has_many :articles, through: :ventelignes
  has_many :cadres, through: :alignes
  #validates :fournisseur_id, presence: true
  accepts_nested_attributes_for :ventelignes
end
