class Venteligne < ActiveRecord::Base
  belongs_to :vente
  belongs_to :cadre
  belongs_to :article
  validates :vente_id, presence: true#, scope: [:article_id, :cadre_id]

  validates_uniqueness_of :vente_id, scope: [:article_id, :cadre_id]

  alidates_numericality_of :qtelivre, :qte
  validates_presence_of :qtelivre, :qte, :prix_u

  #jointure avec produit
  scope :prod, -> { joins(:produit).where("produit_id != -1").order(:created_at) }

  validates :vente_id, presence: true#, scope: [:article_id, :cadre_id]

  validates_uniqueness_of :vente_id, scope: [:produit_id]

  before_save :verifier_vligne
  after_save  :total
  #after_save :total
  after_destroy :total


  def verifier_vligne
    self.montant = qte * prix_u
    if qtelivre > qte
      return false
    end
    #self.save
  end

  def total
    vente.somme = Venteligne.where("vente_id = ?", vente.id).sum('montant')
    vente.save
  end

end
