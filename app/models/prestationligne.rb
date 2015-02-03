class Prestationligne < ActiveRecord::Base
  belongs_to :prestation
  belongs_to :cadre
  belongs_to :formatphoto

  validates :prestation_id, presence: true#, scope: [:formatphoto_id, :cadre_id]

  validates_uniqueness_of :prestation_id, scope: [:formatphoto_id, :cadre_id]

  validates_numericality_of :qtelivre, :qte
  validates_presence_of :qtelivre, :qte, :prix_u

  #jointure avec formatphoto et cadre
  scope :formatphoto, -> { joins(:formatphoto).where("formatphoto_id != -1").order(:created_at) }
  scope :cadre, -> { joins(:cadre).where("cadre_id != -1").order(:created_at) }

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
    prestation.somme = Prestationligne.where("prestation_id = ?", prestation.id).sum('montant')
    prestation.save
  end
end
