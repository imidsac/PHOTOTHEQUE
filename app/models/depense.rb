class Depense < ActiveRecord::Base
  belongs_to :categoriedep
  belongs_to :employe

  by_star_field :date_dep

  #jointure avec categorie
  scope :jointure_categorie, -> { joins(:categoriedep, :employe).order(date_dep: :desc) }

  # Achat journaliers de 00:00 h à 23:59
  scope :journaliers, -> { today.jointure_categorie }
  scope :journaliers_total, -> { today.jointure_categorie.sum('montant') }
  # scope :journe, -> { today.jointure_categorie.limit(10) }
  # scope :jour, -> { where({date_dep: (Time.now.midnight + 0.hours)..Time.now.midnight + 24.hours})}

  # DEPENSES RECENTS
  scope :recent, -> { past_week.jointure_categorie }

  # LISTE DE DEPENSE PAR CATEGORIE
  scope :dep_categorie, ->(categoriedep_id) { jointure_categorie.where("categoriedep_id = ? ", categoriedep_id) }

  scope :dep_total, -> { today.sum('montant') }

end
