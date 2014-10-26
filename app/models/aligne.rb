class Aligne < ActiveRecord::Base
  belongs_to :achat
  belongs_to :article
  validates :achat_id, presence: true

  after_create :give_montant_to_somme
  after_destroy :givey_montant_to_somme

  def give_montant_to_somme
  	achat.somme += montant
  	achat.save
  end

  def givey_montant_to_somme
  	achat.somme -= montant
  	achat.save
  end
  
end
