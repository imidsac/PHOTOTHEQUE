class Venteligne < ActiveRecord::Base
  belongs_to :vente
  belongs_to :cadre
  belongs_to :article
  validates :vente_id, presence: true

  before_save :calcul_de_montant
  after_create :give_montant_to_somme
  after_destroy :givey_montant_to_somme


  def calcul_de_montant
  	self.montant = qte * prix_u
  end

  def give_montant_to_somme
  	vente.somme += montant 
  	vente.save
  end

  def givey_montant_to_somme
  	vente.somme -= montant
  	vente.save
  end

end
