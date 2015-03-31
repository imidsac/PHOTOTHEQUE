class Depense < ActiveRecord::Base
  belongs_to :categoriedep
  belongs_to :employe

  by_star_field :date_dep

  scope :list, ->{select("depenses.id, date_dep, depenses.description, categoriedep_id,beneficiere, categoriedeps.name, employe_id, employes.nom,employes.prenom, montant, etat_dep, tva").order(:date_dep)}

  #jointure avec categorie
  scope :jointure_categorie, -> { select("depenses.id, date_dep, depenses.description, categoriedep_id,beneficiere, categoriedeps.name, employe_id, employes.nom,employes.prenom, montant, etat_dep, tva").joins(:categoriedep, :employe).order(date_dep: :desc) }
  scope :depense_categorie, ->(categoriedep_id) { joins(:categoriedep).where("categoriedep_id = ? ", categoriedep_id) }


  scope :date_between, lambda { |start_date, end_date| jointure_categorie.where("date_dep::date >= ? AND date_dep::date <= ?", start_date, end_date) }
  scope :date_between_total, lambda { |start_date, end_date| jointure_categorie.where("date_dep::date >= ? AND date_dep::date <= ?", start_date, end_date).sum('montant') }
  scope :date_between_depense_total, lambda { |start_date, end_date| where("date_dep::date >= ? AND date_dep::date <= ?", start_date, end_date).sum('montant') }

  # Achat journaliers de 00:00 h à 23:59
  scope :journaliers, -> { today.jointure_categorie }
  scope :journaliers_total, -> { today.jointure_categorie.sum('montant') }
  # scope :journe, -> { today.jointure_categorie.limit(10) }
  # scope :jour, -> { where({date_dep: (Time.now.midnight + 0.hours)..Time.now.midnight + 24.hours})}

  # DEPENSES RECENTS
  scope :recent, -> { jointure_categorie.limit(100) }

  # LISTE DE DEPENSE PAR CATEGORIE
  scope :dep_categorie, ->(categoriedep_id) { jointure_categorie.where("categoriedep_id = ? ", categoriedep_id) }

  scope :dep_total, -> { today.sum('montant') }

  before_save :verifier_depense


  def verifier_depense
    self.description="#{description}".upcase
  end
end
