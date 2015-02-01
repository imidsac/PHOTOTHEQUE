class Achat < ActiveRecord::Base
  default_scope { where("achats.id != ? ", -1)}
  by_star_field :date_achat

  belongs_to :fournisseur
  belongs_to :monetaire
  has_many :alignes, dependent: :destroy
  has_many :articles, through: :alignes
  has_many :cadres, through: :alignes
  has_many :paiements, dependent: :destroy

  #validates :fournisseur_id, presence: true
  accepts_nested_attributes_for :alignes

  before_save :verification


  def verification
    self.payee <= somme
    if fournisseur_id == -1  and fournisseur_libre == 'No'
      return false
    elsif fournisseur_id != -1  and fournisseur_libre != 'No'
      return false
    end
  end

  #jointure avec fournisseur
  scope :jointure_fournisseur, -> { joins(:fournisseur).order(:date_achat) }

  # Achats recents
  scope :recent, -> { past_month.jointure_fournisseur }

  # Achat journaliers de 00:00 h à 23:59
  scope :journaliers, -> { today.jointure_fournisseur }
  #scope :journe, -> { today.jointure_fournisseur }

  # TOTAL SOMME D'ACHAT PAR JOUR
  scope :ttotal, -> { today.sum('somme') }

  # TOTAL PAYEE D'ACHAT PAR JOUR
  scope :ptotal, -> { today.sum('payee') }

  # LISTE DES ACHATS PAYEES
  scope :commande_payee, -> { where("somme = payee ").jointure_fournisseur }

  # LISTE DES ACHATS NO PAYEES
  scope :commande_no_payee, -> { where("somme > payee ").jointure_fournisseur }

  # LISTE DES ACHATS TOTALEMENT LIVRET
  scope :tlivret, -> { where("etat_achat =? ", 't').jointure_fournisseur }

  # LISTE DES ACHATS PARTIELLEMENT LIVRET
  scope :plivret, -> { where("etat_achat =? ", 'p').jointure_fournisseur }

  # LISTE DES ACHATS NO LIVRET
  scope :nlivret, -> { where("etat_achat =? ", 'n').jointure_fournisseur }

  # TOUT LES COMMANDES PAR FOURNISSEUR
  scope :commande_fournisseur, ->(fournisseur_id) { where("fournisseur_id = ?", fournisseur_id)}
  # TOUT LES COMMANDES NO TOTALEMENT PAYEE PAR FOURNISSEUR
  scope :commande_no_payee_fournisseur, ->(fournisseur_id) { where("somme-payee > ? and fournisseur_id = ?", 0, fournisseur_id)}

  # TOTAL DE CREDIT D'UN FOURNISSEUR
  scope :total_doit_payee_fournisseur, ->(fournisseur_id) { where("somme-payee > ? and fournisseur_id = ?", 0, fournisseur_id).sum('somme-payee')}


end
