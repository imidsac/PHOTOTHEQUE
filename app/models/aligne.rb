class Aligne < ActiveRecord::Base
  belongs_to :achat
  belongs_to :article
  belongs_to :cadre
  validates_numericality_of :qtelivre, :qte
  validates_presence_of :qtelivre, :qte, :prix_u


  #produit plus demander
  #scope :plus_pop, -> { group('produit_id', 'qte').having( 'SUM(qte) >= 1').order(:qte).limit(10) }
  scope :plus_pop, -> { having( 'SUM(qte) >= 1').group(:produit_id, :qte).order(:qte) }

  #jointure avec produit
  scope :prod, -> { joins(:produit).where("produit_id != -1").order(:created_at) }

  #somme
  scope :montant_detail, -> { prod.sum('qte*pdetail') }
  scope :montant_gros, -> { prod.sum('qte*pgros') }

  validates :achat_id, presence: true
  validates :produit_id, presence: true

  validates_uniqueness_of :achat_id, scope: [:produit_id]

  before_save :verifier_aligne
  after_save  :total
  #after_save :total
  after_destroy :total


  def verifier_aligne
    self.montant = qte * prix_u
    if qtelivre > qte
      return false
    end
    #self.save
  end

  def total
    achat.somme = Aligne.where("achat_id = ?", achat.id).sum('montant')
    achat.save
  end

end
