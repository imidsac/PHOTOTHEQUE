class Livraisonlog < ActiveRecord::Base
  belongs_to :achat
  belongs_to :produit
  belongs_to :vente
  belongs_to :user
end
