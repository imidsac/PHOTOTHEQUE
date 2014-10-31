class Prestationligne < ActiveRecord::Base
  belongs_to :prestation
  belongs_to :cadre
  belongs_to :formatphoto

  before_save :calcul_de_montant
  after_create :give_montant_to_somme
  after_destroy :givey_montant_to_somme


  def calcul_de_montant
  	self.montant = qte * prix_u
  end

  def give_montant_to_somme
  	prestation.somme += montant 
  	prestation.save
  end

  def givey_montant_to_somme
  	prestation.somme -= montant
  	prestation.save
  end

end
