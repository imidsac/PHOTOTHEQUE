class Achat < ActiveRecord::Base
  belongs_to :fournisseur
  has_many :alignes
  has_many :articles, through: :alignes
  validates :fournisseur_id, presence: true
  accepts_nested_attributes_for :alignes

  scope :article, -> { where("type_ac = ? ", 'A') }
  scope :cadre, -> { where("type_ac = ? ", 'C') }
  scope :payee, -> { where("somme != 0 and somme=payee") }
  scope :nopayee, -> { where("somme != 0 and payee = 0") }
  scope :unitule, -> { where("somme = 0 and payee = 0") }
  scope :tlibre, -> { where("etat_achat = ? ", 't') }
  scope :plibre, -> { where("etat_achat = ? ", 'p') }
  scope :nlibre, -> { where("etat_achat = ? ", 'n') }

end
