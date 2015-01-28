class Vente < ActiveRecord::Base
  belongs_to :boutique
  belongs_to :client
  has_many :ventelignes, dependent: :destroy
  has_many :articles, through: :ventelignes
  has_many :cadres, through: :alignes
  has_many :paiements, dependent: :destroy
  #validates :fournisseur_id, presence: true
  accepts_nested_attributes_for :ventelignes

  by_star_field :date_vente


  #jointure avec boutique et client
  scope :jointure_boutique_client, -> { joins(:boutique, :client) }

  # Achats recents
  scope :recent, -> { past_month.jointure_boutique_client }

  # Achat journaliers de 00:00 h à 23:59
  scope :journaliers, -> { today.jointure_boutique_client }
  #scope :journe, -> { today.jointure_boutique_client }

  # TOTAL SOMME D'ACHAT PAR JOUR
  scope :ttotal, -> { today.sum('somme') }

  # TOTAL PAYEE D'ACHAT PAR JOUR
  scope :ptotal, -> { today.sum('payee') }

  # LISTE DES ACHATS PAYEES
  scope :payee, -> { where("somme = payee ").jointure_boutique_client }

  # LISTE DES ACHATS NO PAYEES
  scope :npayee, -> { where("somme > payee ").jointure_boutique_client }

  # LISTE DES ACHATS TOTALEMENT LIVRET
  scope :tlivret, -> { where("etat_vente =? ", 't').jointure_boutique_client }

  # LISTE DES ACHATS PARTIELLEMENT LIVRET
  scope :plivret, -> { where("etat_vente =? ", 'p').jointure_boutique_client }

  # LISTE DES ACHATS NO LIVRET
  scope :nlivret, -> { where("etat_vente =? ", 'n').jointure_boutique_client }

  # TOUT LES FACTURES NO TOTALEMENT PAYEE PAR CLIENT
  scope :facture_no_payee_client, ->(client_id) { where("somme > payee  and client_id = ?", client_id)}

  # TOUT LES FACTURES PAR CLIENT
  scope :factures_client, ->(client_id) { where("client_id = ?", client_id)}
  # TOUT LES FACTURES PAR BOUTIQUE
  scope :factures_boutique, ->(boutique_id) { where("boutique_id = ?", boutique_id)}

  # TOTAL DE CREDIT D'UN CLIENT
  scope :total_doit_payee_client, ->(client_id) { where("somme-payee > ? and client_id = ?", 0, client_id).sum('somme-payee')}

  # TOUT LES FACTURES NO TOTALEMENT PAYEE PAR BOUTIQUE
  scope :facture_no_payee_boutique, ->(boutique_id) { where("somme-payee > ? and boutique_id = ?", 0, boutique_id)}

  # TOTAL DE CREDIT D'UN BOUTIQUE
  scope :total_doit_payee_boutique, ->(boutique_id) { where("somme-payee > ? and boutique_id = ?", 0, boutique_id).sum('somme-payee')}

  before_save :verifier_vente
  before_create :get_code_fac

  def verifier_vente
    if client_id == -1 and boutique_id == -1 and client_libre == 'No'
      return false
    elsif client_id != -1 and boutique_id != -1 and client_libre != 'No'
      return false
    elsif client_id == -1 and boutique_id == -1 and client_libre == 'No'
      return false
    elsif client_id != -1 and boutique_id != -1 and client_libre == 'No'
      return false
    end
  end



  def get_code_fac
    @id = Vente.last
    if client_id > 0
      if @id == nil
        self.num_ve = "#{1}"+'-'+ "#{client_id}C"+'/'+Time.now.strftime("%m")+''+Time.now.strftime("%y")
      else
        self.num_ve = "#{@id.id+1}"+'-'+ "#{client_id}C"+'/'+Time.now.strftime("%m")+''+Time.now.strftime("%y")
      end
    elsif boutique_id > 0
      if @id == nil
        self.num_ve = "#{1}"+'-'+ "#{boutique_id}B"+'/'+Time.now.strftime("%m")+''+Time.now.strftime("%y")
      else

        self.num_ve = "#{@id.id+1}"+'-'+ "#{boutique_id}B"+'/'+Time.now.strftime("%m")+''+Time.now.strftime("%y")
      end
    else client_id == -1 and boutique_id == -1
    if @id == nil
      self.num_ve = "#{1}"+'-'+ "NC"+'/'+Time.now.strftime("%m")+''+Time.now.strftime("%y")
    else

      self.num_ve = "#{@id.id+1}"+'-'+ "NC"+'/'+Time.now.strftime("%m")+''+Time.now.strftime("%y")
    end

    end

  end

end
