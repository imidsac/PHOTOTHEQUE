class Paiement < ActiveRecord::Base
	belongs_to :banque
	belongs_to :boutique
	belongs_to :vente
	belongs_to :prestation
	belongs_to :client
	belongs_to :achat
	belongs_to :fournisseur

	scope :jointure_banque, -> { joins(:banque)}
	scope :jointure_boutique, -> { joins(:boutique)}
	scope :jointure_client, -> { joins(:client)}
	scope :jointure_vente, -> { joins(:vente)}
	scope :jointure_prestation, -> { joins(:prestation)}
	scope :jointure_fournisseur, -> { joins(:fournisseur)}
	scope :jointure_achat, -> { joins(:achat)}
	#jointure avec boutique et client
	scope :jointure_boutique_client_vente_achat_fournisseur, -> { joins(:boutique, :client, :vente, :achat, :fournisseur) }

	####JOURNALIER####
	scope :journaliers_vente_boutique, -> { today.jointure_boutique.jointure_vente.jointure_banque }
	scope :journaliers_vente_client, -> { today.jointure_client.jointure_vente.jointure_banque }
	scope :journaliers_prestation_client, -> { today.jointure_client.jointure_prestation.jointure_banque }

	scope :journaliers_vente_total, -> { today.jointure_vente.sum('montant') }
	scope :journaliers_prestation_total, -> { today.jointure_prestation.sum('montant') }
	scope :journaliers_boutique_total, -> { today.jointure_boutique.sum('montant') }

	scope :journaliers_achat_total, -> { today.jointure_achat.sum('montant') }
	scope :journaliers_achat_fournisseur, -> { today.jointure_fournisseur.jointure_achat.jointure_banque }


	#####FOURNISSEUR####
	# TOUT LES PAIEMENTS EFFECTUER POUR FOURNISSEUR
	scope :tout_paiement_fournisseur, ->(fournisseur_id) { where("fournisseur_id = ?", fournisseur_id)}
	# TOTAL LES PAIEMENTS EFFECTUER POUR FOURNISSEUR
	scope :total_paiement_fournisseur, ->(fournisseur_id) { where("fournisseur_id = ?", fournisseur_id).sum('montant')}

	###BOUTIQUE####
	# TOUT LES PAIEMENTS EFFECTUER POUR BOUTIQUE
	scope :tout_paiement_boutique, ->(boutique_id) { where("boutique_id = ?", boutique_id)}
	# TOTAL LES PAIEMENTS EFFECTUER POUR BOUTIQUE
	scope :total_paiement_boutique, ->(boutique_id) { where("boutique_id = ?", boutique_id).sum('montant')}

	###CLIENT####
	# TOUT LES PAIEMENTS EFFECTUER POUR CLIENT
	scope :tout_paiement_client, ->(client_id) { where("client_id = ?", client_id)}
	# TOTAL LES PAIEMENTS EFFECTUER POUR CLIENT
	scope :total_paiement_client, ->(client_id) { where("client_id = ?", client_id).sum('montant')}

	###ACHAT####
	# TOUT LES PAIEMENTS EFFECTUER POUR ACHAT
	scope :tout_paiement_achat, ->(achat_id) { where("achat_id = ?", achat_id)}
	# TOTAL LES PAIEMENTS EFFECTUER POUR ACHAT
	scope :total_paiement_achat, ->(achat_id) { where("achat_id = ?", achat_id).sum('montant')}
	scope :vtotal_paiement_achat, ->(achat_id, mont) { (mont).to_i + total_paiement_achat(achat_id).to_i}

	###VENTE####
	# TOUT LES PAIEMENTS EFFECTUER POUR VENTE
	scope :tout_paiement_vente, ->(vente_id) { where("vente_id = ?", vente_id)}
	# TOTAL LES PAIEMENTS EFFECTUER POUR VENTE
	scope :total_paiement_vente, ->(vente_id) { where("vente_id = ?", vente_id).sum('montant')}
	scope :vtotal_paiement_vente, ->(vente_id, mont) { (mont).to_i + total_paiement_vente(vente_id).to_i}

###PRESTATION####
	# TOUT LES PAIEMENTS EFFECTUER POUR PRESTATION
	scope :tout_paiement_prestation, ->(prestation_id) { where("prestation_id = ?", prestation_id)}
	# TOTAL LES PAIEMENTS EFFECTUER POUR PRESTATION
	scope :total_paiement_prestation, ->(prestation_id) { where("prestation_id = ?", prestation_id).sum('montant')}
	scope :ptotal_paiement_prestation, ->(prestation_id, mont) { (mont).to_i + total_paiement_prestation(prestation_id).to_i}



	before_save :verifier_paiement

	def verifier_paiement
		if achat_id.present? and Paiement.vtotal_paiement_achat("#{achat_id}","#{montant}") > achat.somme
			return false
		elsif vente_id.present? and Paiement.vtotal_paiement_vente("#{vente_id}","#{montant}") > vente.somme
			return false
		elsif prestation_id.present? and Paiement.ptotal_paiement_prestation("#{prestation_id}","#{montant}") > prestation.somme
			return false
		end
	end


end
