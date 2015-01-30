class Aligne < ActiveRecord::Base
  belongs_to :achat
  belongs_to :article
  belongs_to :cadre
  validates_numericality_of :qtelivre, :qte
  validates_presence_of :qtelivre, :qte, :prix_u


  #produit plus demander
  #scope :plus_pop, -> { group('produit_id', 'qte').having( 'SUM(qte) >= 1').order(:qte).limit(10) }
  scope :plus_pop, -> { having( 'SUM(qte) >= 1').group(:article_id, :qte).order(:qte) }

  #jointure avec produit
  scope :article, -> { joins(:article).where("article_id != -1").order(:created_at) }
  scope :cadre, -> { joins(:cadre).where("cadre_id != -1").order(:created_at) }

  #somme
  scope :montant_detail_article, -> { article.sum('qte*pdetail') }
  scope :montant_gros_article, -> { article.sum('qte*pgros') }

  scope :montant_detail_cadre, -> { cadre.sum('qte*pdetail') }
  scope :montant_gros_cadre, -> { cadre.sum('qte*pgros') }

  validates :achat_id, presence: true
  validates :article_id, presence: true
  validates :cadre_id, presence: true

  validates_uniqueness_of :achat_id, scope: [:article_id, :cadre_id]

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
