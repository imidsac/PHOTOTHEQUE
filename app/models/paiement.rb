class Paiement < ActiveRecord::Base
  belongs_to :vente
  belongs_to :client
  belongs_to :achat
  belongs_to :fournisseur
end
