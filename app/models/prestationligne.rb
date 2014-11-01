class Prestationligne < ActiveRecord::Base
  belongs_to :prestation
  belongs_to :cadre
  belongs_to :formatphoto

  before_save :montant 
  after_save  :total
  #after_save :total
  after_destroy :total


  def montant
    self.montant = qte * prix_u
  end

  def total
    prestation.somme = Prestationligne.where("prestation_id = ?", prestation.id).sum('montant')
    prestation.save
  end
end
