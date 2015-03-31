class Achat < ActiveRecord::Base
  default_scope { where("achats.id != ? ", -1)}
  scope :list, -> { select("achats.id, fournisseur_id,fournisseur_libre, name_company, nom, prenom,type_ac, date_achat,somme, payee, etat_achat").order(date_achat: :desc) }
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

  scope :date_between, lambda { |start_date, end_date| list.jointure_fournisseur.where("date_achat::date >= ? AND date_achat::date <= ?", start_date, end_date) }
  scope :date_between_total, lambda { |start_date, end_date| list.jointure_fournisseur.where("date_achat::date >= ? AND date_achat::date <= ?", start_date, end_date).sum('somme') }
  scope :date_between_payee, lambda { |start_date, end_date| list.jointure_fournisseur.where("date_achat::date >= ? AND date_achat::date <= ?", start_date, end_date).sum('payee') }
  scope :date_between_credit, lambda { |start_date, end_date| where("date_achat::date >= ? AND date_achat::date <= ? AND somme > payee ", start_date, end_date) }

  def verification
    self.payee <= somme
    if fournisseur_id == -1 and fournisseur_libre == 'No'
      return false
    elsif fournisseur_id != -1 and fournisseur_libre != 'No'
      return false
    end
    self.fournisseur_libre="#{fournisseur_libre}".capitalize
  end

  #jointure avec fournisseur
  scope :jointure_fournisseur, -> { joins(:fournisseur) }

  # Achats recents
  scope :recent, -> { past_week.list.jointure_fournisseur }

  # Achat journaliers de 00:00 h à 23:59
  scope :journaliers, -> { today.jointure_fournisseur }
  #scope :journe, -> { today.jointure_fournisseur }

  # TOTAL SOMME D'ACHAT PAR JOUR
  scope :ttotal, -> { today.sum('somme') }
  scope :attotal, -> { today.sum('asomme') }

  # TOTAL PAYEE D'ACHAT PAR JOUR
  scope :ptotal, -> { today.sum('payee') }
  scope :aptotal, -> { today.sum('apayee') }

  # LISTE DES ACHATS PAYEES
  scope :commande_payee, -> { where("somme = payee ").jointure_fournisseur }
  scope :acommande_payee, -> { where("asomme = apayee ").jointure_fournisseur }

  # LISTE DES ACHATS NO PAYEES
  scope :commande_no_payee, -> { where("somme > payee ").jointure_fournisseur }
  scope :acommande_no_payee, -> { where("asomme > apayee ").jointure_fournisseur }

  # LISTE DES ACHATS TOTALEMENT LIVRET
  scope :tlivret, -> { where("etat_achat =? ", 't').jointure_fournisseur }

  # LISTE DES ACHATS PARTIELLEMENT LIVRET
  scope :plivret, -> { where("etat_achat =? ", 'p').jointure_fournisseur }

  # LISTE DES ACHATS NO LIVRET
  scope :nlivret, -> { where("etat_achat =? ", 'n').jointure_fournisseur }

  # TOUT LES COMMANDES PAR FOURNISSEUR
  scope :commande_fournisseur, ->(fournisseur_id) { where("fournisseur_id = ?", fournisseur_id) }
  # TOUT LES COMMANDES NO TOTALEMENT PAYEE PAR FOURNISSEUR
  scope :commande_no_payee_fournisseur, ->(fournisseur_id) { where("somme-payee > ? and fournisseur_id = ?", 0, fournisseur_id) }

  # TOTAL DE CREDIT D'UN FOURNISSEUR
  scope :credit_fournisseur, ->(fournisseur_id) { where("somme-payee > ? and fournisseur_id = ?", 0, fournisseur_id).sum('somme-payee') }
  # TOTAL DE CREDIT DE TOUT LES FOURNISSEURS FIDELES
  scope :credit_fournisseurs_fideles, -> { select("fournisseur_id, name_company, nom, prenom,sum(somme) as somme, sum(payee) as payee").jointure_fournisseur.where("somme-payee > ? and fournisseur_id != ?", 0, -1).group(:fournisseur_id, :name_company, :nom, :prenom) }
  #scope :credit_fournisseurs_fideles, -> { select("achats.id,fournisseur_id, name_company, nom, prenom,sum(somme) as somme, sum(payee) as payee").jointure_fournisseur.where("somme-payee > ? and fournisseur_id != ?", 0, -1).group(:fournisseur_id) }
  # TOTAL DE CREDIT DE TOUT LES FOURNISSEURS LIBRES
  scope :credit_fournisseurs_libres, -> { select("achats.id,fournisseur_libre,date_achat, etat_achat, somme, payee").where("somme-payee > ? and fournisseur_id = ?", 0, -1) }


end
