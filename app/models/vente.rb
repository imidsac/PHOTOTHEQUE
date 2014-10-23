class Vente < ActiveRecord::Base
  belongs_to :boutique
  belongs_to :client
end
