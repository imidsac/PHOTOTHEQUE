class Retourelog < ActiveRecord::Base
  belongs_to :produit
  belongs_to :optionretoure
  belongs_to :achat
  belongs_to :vente
  belongs_to :user
end
