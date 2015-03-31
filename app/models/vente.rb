class Vente < ActiveRecord::Base
  default_scope { where("ventes.id != ? ", -1)}
  belongs_to :boutique
  belongs_to :client
  has_many :ventelignes, dependent: :destroy
  has_many :articles, through: :ventelignes
  has_many :cadres, through: :alignes
  has_many :paiements, dependent: :destroy
  #validates :fournisseur_id, presence: true
  accepts_nested_attributes_for :ventelignes

  scope :list, -> { select("ventes.id,boutique_id,name, client_id,nom, prenom,client_libre, date_vente,somme, payee, etat_vente, valide").order(date_vente: :desc) }

  by_star_field :date_vente

  scope :date_between, lambda { |start_date, end_date| list.jointure_boutique_client.where("date_vente::date >= ? AND date_vente::date <= ?", start_date, end_date) }
  scope :date_between_total, lambda { |start_date, end_date| list.jointure_boutique_client.where("date_vente::date >= ? AND date_vente::date <= ?", start_date, end_date).sum('somme') }
  scope :date_between_payee, lambda { |start_date, end_date| list.jointure_boutique_client.where("date_vente::date >= ? AND date_vente::date <= ?", start_date, end_date).sum('payee') }
  scope :date_between_credit, lambda { |start_date, end_date| where("date_vente::date >= ? AND date_vente::date <= ? AND somme > payee ", start_date, end_date) }

  #jointure avec boutique et client
  scope :jointure_boutique, -> { joins(:boutique) }
  scope :jointure_client, -> { joins(:client) }
  scope :jointure_boutique_client, -> { list.joins(:boutique, :client) }

  # Achats recents
  scope :recent, -> { past_week.jointure_boutique_client }

  # Achat journaliers de 00:00 h à 23:59
  scope :journaliers, -> { today.jointure_boutique_client }
  #scope :journe, -> { today.jointure_boutique_client }

  # TOTAL SOMME D'ACHAT PAR JOUR
  scope :ttotal, -> { today.sum('somme') }
  scope :attotal, -> { today.sum('asomme') }

  # TOTAL PAYEE D'ACHAT PAR JOUR
  scope :ptotal, -> { today.sum('payee') }
  scope :aptotal, -> { today.sum('apayee') }

  # LISTE DES VENTES PAYEES
  scope :payee, -> { where("somme = payee ").jointure_boutique_client }
  scope :apayee, -> { where("asomme = apayee ").jointure_boutique_client }

  # LISTE DES VENTES NO PAYEES
  scope :npayee, -> { where("somme > payee ").jointure_boutique_client }
  scope :napayee, -> { where("asomme > apayee ").jointure_boutique_client }

  # LISTE DES ACHATS TOTALEMENT LIVRET
  scope :tlivret, -> { where("etat_vente =? ", 't').jointure_boutique_client }

  # LISTE DES ACHATS PARTIELLEMENT LIVRET
  scope :plivret, -> { where("etat_vente =? ", 'p').jointure_boutique_client }

  # LISTE DES ACHATS NO LIVRET
  scope :nlivret, -> { where("etat_vente =? ", 'n').jointure_boutique_client }

  # TOUT LES FACTURES NO TOTALEMENT PAYEE PAR CLIENT
  scope :facture_no_payee_client, ->(client_id) { where("somme > payee  and client_id = ?", client_id) }

  # SOMME TOTAL D'UN FACTURE
  scope :facture_somme, ->(num) { where("ventes.id = ?", num).sum('somme')}
  # TOUT LES FACTURE PAR NUMERO FACTURE
  scope :facture_code, ->(num) { where("ventes.id = ?", num)}
  # TOUT LES FACTURES PAR CLIENT
  scope :factures_client, ->(client_id) { where("client_id = ?", client_id) }
  # TOTAL DE CREDIT D'UN CLIENT
  scope :credit_client, ->(client_id) { where("somme-payee > ? and client_id = ?", 0, client_id).sum('somme-payee') }
  # TOTAL DE CREDIT DE TOUT LES CLIENTS FIDELES
  scope :credit_clients_fideles, -> { select("client_id,nom, prenom,sum(somme) as somme, sum(payee) as payee").jointure_client.where("somme-payee > ? AND client_id != ?", 0, -1).group(:client_id, :nom, :prenom) }
  # TOTAL DE CREDIT DE TOUT LES CLIENTS LIBRES
  scope :credit_clients_libres, -> { select("ventes.id,client_libre,date_vente, somme,payee, etat_vente").where("somme-payee > ? AND client_id = ? AND boutique_id = ?", 0, -1, -1) }

  # TOUT LES FACTURES PAR BOUTIQUE
  scope :factures_boutique, ->(boutique_id) { where("boutique_id = ?", boutique_id) }
  # TOUT LES FACTURES NO TOTALEMENT PAYEE PAR BOUTIQUE
  scope :facture_no_payee_boutique, ->(boutique_id) { where("somme-payee > ? and boutique_id = ?", 0, boutique_id) }
  # TOTAL DE CREDIT D'UN BOUTIQUE
  scope :credit_boutique, ->(boutique_id) { where("somme-payee > ? and boutique_id = ?", 0, boutique_id).sum('somme-payee') }
  # TOTAL DE CREDIT DE TOUT LES BOUTIQUE
  scope :credit_boutiques_fideles, -> { select("boutique_id,name,sum(somme) as somme, sum(payee) as payee").jointure_boutique.where("somme-payee > ? AND boutique_id > ?", 0, 0).group(:boutique_id, :name) }

  before_save :verifier_vente
  #before_create :get_code_fac

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
    self.client_libre="#{client_libre}".upcase
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
    else
      client_id == -1 and boutique_id == -1
      if @id == nil
        self.num_ve = "#{1}"+'-'+ "NC"+'/'+Time.now.strftime("%m")+''+Time.now.strftime("%y")
      else
        self.num_ve = "#{@id.id+1}"+'-'+ "NC"+'/'+Time.now.strftime("%m")+''+Time.now.strftime("%y")
      end
    end
  end
end
