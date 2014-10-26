class Achat < ActiveRecord::Base
  belongs_to :fournisseur
  has_many :alignes
  
end
