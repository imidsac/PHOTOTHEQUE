class Aligne < ActiveRecord::Base
  belongs_to :achat
  belongs_to :article
  belongs_to :cadre
  validates :achat_id, presence: true

  before_save :montant, :etat_n, :etat_p, :etat_t
  after_create :give_montant_to_somme
  after_destroy :givey_montant_to_somme

=begin
  def etat_n
    self.etat = 'n' if qtelivre = 0 
  end
  def etat_p
    self.etat = 'p' if qtelivre > 0 && qtelivre < qte
  end
  def etat_t
    self.etat = 't' if qtelivre = qte
  end
=end

  def montant
  	self.montant = qte * prix_u
  end

  def give_montant_to_somme
  	achat.somme += montant 
  	achat.save
  end

  def givey_montant_to_somme
  	achat.somme -= montant
  	achat.save
  end

end
