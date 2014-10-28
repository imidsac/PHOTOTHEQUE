class Venteligne < ActiveRecord::Base
  belongs_to :vente
  belongs_to :cadre
  belongs_to :article
end
