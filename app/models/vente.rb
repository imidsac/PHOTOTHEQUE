class Vente < ActiveRecord::Base
  belongs_to :boutique
  belongs_to :client
  has_many :ventelignes, dependent: :destroy
  has_many :articles, through: :ventelignes
  has_many :cadres, through: :alignes
  has_many :paiements, dependent: :destroy
  #validates :fournisseur_id, presence: true
  accepts_nested_attributes_for :ventelignes

  # Client libre
  scope :client_libre, -> { where("client_id = ? and boutque_id = ?" -1 -1) }

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


  def datestring
    date_vente.to_s(:db)
  end

  def datestring=(date_vente_str)
    self.date_vente = Time.parse(date_vente_str)
  end

end
