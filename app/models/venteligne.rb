class Venteligne < ActiveRecord::Base
  belongs_to :vente
  belongs_to :cadre
  belongs_to :article
  validates :vente_id, presence: true

  before_save :montant 
  after_save  :total
  #after_save :total
  after_destroy :total


  def montant
    self.montant = qte * prix_u
  end

  def total
    vente.somme = Venteligne.where("vente_id = ?", vente.id).sum('montant')
    vente.save
  end

end
