class Achat < ActiveRecord::Base
  belongs_to :fournisseur
  belongs_to :monetaire
  has_many :alignes, dependent: :destroy
  has_many :articles, through: :alignes
  has_many :cadres, through: :alignes
  has_many :paiements, dependent: :destroy

  #validates :fournisseur_id, presence: true
  accepts_nested_attributes_for :alignes

  # Fournisseur libre
  scope :fournisseur_libre, -> { where("fournisseur_id = ? and type_ac = ? ", -1, 'C') }

  # Fournisseur
  scope :fournisseur, -> { where("fournisseur_id != ? ", -1) }
  scope :article, -> { where("type_ac = ? ", 'A') }
  scope :cadre, -> { where("type_ac = ? ", 'C') }
  scope :payee, -> { where("somme != 0 and somme=payee") }
  scope :nopayee, -> { where("somme != 0 and payee = 0") }
  scope :unitule, -> { where("somme = 0 and payee = 0") }
  scope :tlibre, -> { where("etat_achat = ? ", 't') }
  scope :plibre, -> { where("etat_achat = ? ", 'p') }
  scope :nlibre, -> { where("etat_achat = ? ", 'n') }

end
