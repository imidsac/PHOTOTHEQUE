class Prestation < ActiveRecord::Base
  default_scope { where("prestations.id != ? ", -1)}
  belongs_to :client
  belongs_to :employe
  has_many :paiements, dependent: :destroy
  has_many :prestationlignes, dependent: :destroy
  accepts_nested_attributes_for :prestationlignes
  has_many :prestation_attachments, dependent: :destroy
  #has_many :paiements, through: :clients, dependent: :destroy
  accepts_nested_attributes_for :prestation_attachments

  by_star_field :date_prestation

  scope :list, -> { select("prestations.id,employe_id,employes.nom as em_nom, employes.prenom as em_prenom, client_id,clients.nom, clients.prenom,client_libre,type_pr, date_prestation,somme, payee, etat_prestation").order(date_prestation: :desc) }

  scope :date_between, lambda { |start_date, end_date| list.jointure_employe_client.where("date_prestation::date >= ? AND date_prestation::date <= ?", start_date, end_date) }
  scope :date_between_total, lambda { |start_date, end_date| list.jointure_employe_client.where("date_prestation::date >= ? AND date_prestation::date <= ?", start_date, end_date).sum('somme') }
  scope :date_between_payee, lambda { |start_date, end_date| list.jointure_employe_client.where("date_prestation::date >= ? AND date_prestation::date <= ?", start_date, end_date).sum('payee') }
  scope :date_between_credit, lambda { |start_date, end_date| where("date_prestation::date >= ? AND date_prestation::date <= ? AND somme > payee ", start_date, end_date) }


  #jointure avec employee et client
  scope :jointure_employe_client, -> { joins(:employe, :client) }
  scope :jointure_client, -> { joins(:client) }

  # Achats recents
  scope :recent, -> { past_month.jointure_employe_client }

  # Achat journaliers de 00:00 h à 23:59
  scope :journaliers, -> { today.jointure_employe_client }
  #scope :journe, -> { today.jointure_employe_client }

  # TOTAL SOMME D'ACHAT PAR JOUR
  scope :ttotal, -> { today.sum('somme') }

  # TOTAL PAYEE D'ACHAT PAR JOUR
  scope :ptotal, -> { today.sum('payee') }

  # LISTE DES ACHATS PAYEES
  scope :payee, -> { where("somme = payee ").jointure_employe_client }

  # LISTE DES ACHATS NO PAYEES
  scope :npayee, -> { where("somme > payee ").jointure_employe_client }

  # LISTE DES ACHATS TOTALEMENT LIVRET
  scope :tlivret, -> { where("etat_prestation =? ", 't').jointure_employe_client }

  # LISTE DES ACHATS PARTIELLEMENT LIVRET
  scope :plivret, -> { where("etat_prestation =? ", 'p').jointure_employe_client }

  # LISTE DES ACHATS NO LIVRET
  scope :nlivret, -> { where("etat_prestation =? ", 'n').jointure_employe_client }

  # TOUT LES PRESTATIONS NO TOTALEMENT PAYEE PAR CLIENT
  scope :prestation_no_payee_client, ->(client_id) { where("somme > payee  and client_id = ?", client_id)}

  # TOUT LES PRESTATIONS PAR CLIENT
  scope :prestations_client, ->(client_id) { where("client_id = ?", client_id)}
  # TOUT LES PRESTATIONS PAR EMPLOYEE
  scope :prestations_employe, ->(employe_id) { where("employe_id = ?", employe_id)}

  # TOTAL DE CREDIT D'UN CLIENT
  scope :total_doit_payee_client, ->(client_id) { where("somme-payee > ? and client_id = ?", 0, client_id).sum('somme-payee')}

  # TOUT LES PRESTATIONS NO TOTALEMENT PAYEE PAR EMPLOYEE
  scope :prestation_no_payee_employe, ->(employe_id) { where("somme-payee > ? and employe_id = ?", 0, employe_id)}

  # TOTAL DE CREDIT D'UN EMPLOYEE
  scope :total_doit_payee_employe, ->(employe_id) { where("somme-payee > ? and employe_id = ?", 0, employe_id).sum('somme-payee')}


  # TOTAL DE CREDIT D'UN CLIENT
  scope :credit_client, ->(client_id) { where("somme-payee > ? and client_id = ?", 0, client_id).sum('somme-payee') }
  # TOTAL DE CREDIT DE TOUT LES CLIENTS FIDELES
  scope :credit_clients_fideles, -> { select("client_id,nom, prenom,sum(somme) as somme, sum(payee) as payee").jointure_client.where("somme-payee > ? AND client_id != ?", 0, -1).group(:client_id, :nom, :prenom) }
  # TOTAL DE CREDIT DE TOUT LES CLIENTS LIBRES
  scope :credit_clients_libres, -> { select("prestations.id,client_libre,date_prestation, somme,payee, etat_prestation").where("somme-payee > ? AND client_id = ?", 0, -1) }


  before_save :verifier_prestation
  before_create :get_code_fac

  def verifier_prestation
    if client_id == -1 and employe_id == -1 and client_libre == 'No'
      return false
    elsif client_id != -1 and employe_id != -1 and client_libre != 'No'
      return false
    elsif client_id == -1 and employe_id == -1 and client_libre == 'No'
      return false
    end
  end



  def get_code_fac
    @id = Prestation.last
    if client_id > 0
      if @id == nil
        self.num_pr = "#{1}"+'-'+ "#{client_id}C"+'/'+Time.now.strftime("%m")+''+Time.now.strftime("%y")
      else
        self.num_pr = "#{@id.id+1}"+'-'+ "#{client_id}C"+'/'+Time.now.strftime("%m")+''+Time.now.strftime("%y")
      end
    elsif employe_id > 0
      if @id == nil
        self.num_pr = "#{1}"+'-'+ "#{employe_id}B"+'/'+Time.now.strftime("%m")+''+Time.now.strftime("%y")
      else

        self.num_pr = "#{@id.id+1}"+'-'+ "#{employe_id}B"+'/'+Time.now.strftime("%m")+''+Time.now.strftime("%y")
      end
    else client_id == -1 and employe_id == -1
    if @id == nil
      self.num_pr = "#{1}"+'-'+ "NC"+'/'+Time.now.strftime("%m")+''+Time.now.strftime("%y")
    else

      self.num_pr = "#{@id.id+1}"+'-'+ "NC"+'/'+Time.now.strftime("%m")+''+Time.now.strftime("%y")
    end

    end

  end

end
