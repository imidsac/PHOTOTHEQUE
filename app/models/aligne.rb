class Aligne < ActiveRecord::Base
  belongs_to :achat
  belongs_to :article, -> {order(:name)}
  belongs_to :cadre
  validates :achat_id, presence: true
  validates :cadre_id, presence: true
  validates :article_id, presence: true

  validates_uniqueness_of :achat_id, scope: [:article_id, :cadre_id]

  before_save :montant 
  after_save  :total
  #after_save :total
  after_destroy :total


  def montant
    self.montant = qte * prix_u
  end

  def total
  	achat.somme = Aligne.where("achat_id = ?", achat.id).sum('montant')
  	achat.save
  end

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

end
