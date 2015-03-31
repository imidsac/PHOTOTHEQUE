class Retourelog < ActiveRecord::Base
  belongs_to :produit
  belongs_to :optionretoure
  belongs_to :achat
  belongs_to :vente
  belongs_to :prestation
  belongs_to :user

  by_star_field :created_at

  scope :list_receptions, -> { where("type_re = ?", 'Reception')}
  scope :list_livraisons, -> { where("type_re = ?", 'Livraison')}

  scope :prod, -> { joins(:produit).where("produit_id != -1").order(:created_at) }

  # TOTAL QUANTITÉ  EFFECTUER POUR ACHAT
  scope :total_retoure_achat, ->(achat_id, produit_id) { where("achat_id = ? and produit_id = ?", achat_id, produit_id).sum('qte') }
  scope :atotal_retoure_achat, ->(achat_id, produit_id, qte) { (qte).to_i + total_retoure_achat(achat_id, produit_id).to_i }

  # TOTAL QUANTITÉ  EFFECTUER POUR VENTE
  scope :total_retoure_vente, ->(vente_id, produit_id) { where("vente_id = ? and produit_id = ?", vente_id, produit_id).sum('qte') }
  scope :vtotal_retoure_vente, ->(vente_id, produit_id, qte) { (qte).to_i + total_retoure_vente(vente_id, produit_id).to_i }

  scope :journaliers_reception, -> { today.list_receptions}
  scope :journaliers_livraison, -> { today.list_livraisons}

  # RECEPTION || RETOURE VENTE
  scope :attotal, -> { journaliers_reception.sum('montant') }
  scope :date_between_attotal, lambda { |start_date, end_date| list_receptions.where("created_at::date >= ? AND created_at::date <= ?", start_date, end_date).sum('montant') }
  # LIVRAISON || RETOURE D'ACHAT
  scope :acttotal, -> { journaliers_livraison.sum('montant') }
  scope :date_between_acttotal, lambda { |start_date, end_date| list_livraisons.where("created_at::date >= ? AND created_at::date <= ?", start_date, end_date).sum('montant') }

  before_save :verifier_retourelog


  def verifier_retourelog
    #self.prix_u = Venteligne.get_prix_u("#{vente_id}", "#{produit_id}")
    #self.montant = qte * prix_u
    if achat_id.present? and achat_id > -1 and Retourelog.atotal_retoure_achat("#{achat_id}", "#{produit_id}", "#{qte}") > Aligne.total_retoure_achat("#{achat_id}", "#{produit_id}").to_i
      return false
    elsif vente_id.present? and vente_id > -1 and Retourelog.vtotal_retoure_vente("#{vente_id}", "#{produit_id}", "#{qte}") > Venteligne.total_retoure_vente("#{vente_id}", "#{produit_id}").to_i
      return false
    end
  end
end
