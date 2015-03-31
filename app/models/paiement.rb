class Paiement < ActiveRecord::Base
	belongs_to :banque
	belongs_to :boutique
	belongs_to :vente
	belongs_to :prestation
	belongs_to :client
	belongs_to :achat
	belongs_to :fournisseur

	scope :list, -> { select("paiements.id, datepaiement, type_paiement, achat_id, vente_id, prestation_id, banque_id, motif, montant").order(datepaiement: :desc) }

	scope :jointure_banque, -> { select("banques.nom as bank, banques.compte").joins(:banque) }
	scope :jointure_boutique, -> { select("name").joins(:boutique) }
	scope :jointure_client, -> { select("clients.nom, clients.prenom").joins(:client) }
	scope :jointure_vente, -> { select("num_ve").joins(:vente) }
	scope :jointure_prestation, -> { select("num_pr").joins(:prestation) }
	scope :jointure_fournisseur, -> { select("name_company").joins(:fournisseur) }
	scope :jointure_achat, -> { select("fournisseur_libre, num_ac").joins(:achat, :banque) }

	# PAIEMEMT RECENT
	scope :recent, -> { list.jointure_banque.jointure_boutique.jointure_client.jointure_vente.jointure_prestation.jointure_fournisseur.jointure_achat.limit(100) }

	scope :date_between, lambda { |start_date, end_date| list.jointure_banque.jointure_boutique.jointure_client.jointure_vente.jointure_prestation.jointure_fournisseur.jointure_achat.where("datepaiement::date >= ? AND datepaiement::date <= ?", start_date, end_date) }


	# SOMME PAYEE POUR RETOURE VENTE
	scope :aptotal, -> { today.where("type_paiement = ?", 'pvr').sum('montant') }
	scope :date_between_aptotal, lambda { |start_date, end_date| tout_paiement_pvr.where("datepaiement::date >= ? AND datepaiement::date <= ?", start_date, end_date).sum('montant') }
	# SOMME PAYEE POUR RETOURE D'ACHAT
	scope :acptotal, -> { today.where("type_paiement = ?", 'par').sum('montant') }
	scope :date_between_acptotal,lambda { |start_date, end_date| tout_paiement_par.where("datepaiement::date >= ? AND datepaiement::date <= ?", start_date, end_date).sum('montant') }

	#jointure avec boutique et client
	scope :jointure_boutique_client_vente_achat_fournisseur, -> { joins(:boutique, :client, :vente, :achat, :fournisseur) }
	scope :jointure_boutique_client_vente, -> { select("type_paiement, paiements.id,vente_id as vente_num, name, clients.nom as nom_cl, prenom, client_libre, banques.nom, banques.compte, motif, montant").joins(:boutique, :client, :vente, :banque) }


	########################################################## BETWEEN ######################################################################
	scope :date_between_vente_total, lambda { |start_date, end_date| jointure_vente.where("datepaiement::date >= ? AND datepaiement::date <= ?", start_date, end_date).sum('montant') }
	scope :date_between_vente, lambda { |start_date, end_date| jointure_boutique_client_vente.where("datepaiement::date >= ? AND datepaiement::date <= ?", start_date, end_date) }
	scope :date_between_achat_total, lambda { |start_date, end_date| jointure_achat.where("datepaiement::date >= ? AND datepaiement::date <= ?", start_date, end_date).sum('montant') }
	scope :date_between_achat, lambda { |start_date, end_date| jointure_achat.where("datepaiement::date >= ? AND datepaiement::date <= ?", start_date, end_date) }

	####JOURNALIER####
	scope :journaliers_vente, -> { today.jointure_boutique_client_vente }
	scope :journaliers_vente_boutique, -> { today.jointure_boutique.jointure_vente.jointure_banque }
	scope :journaliers_vente_client, -> { today.jointure_client.jointure_vente.jointure_banque }
	scope :journaliers_prestation_client, -> { today.jointure_client.jointure_prestation.jointure_banque }

	scope :journaliers_vente_total, -> { today.jointure_vente.sum('montant') }
	scope :journaliers_prestation_total, -> { today.jointure_prestation.sum('montant') }
	scope :journaliers_boutique_total, -> { today.jointure_boutique.sum('montant') }

	scope :journaliers_achat_total, -> { today.jointure_achat.sum('montant') }
	scope :journaliers_achat_fournisseur, -> { today.jointure_fournisseur.jointure_achat.jointure_banque }

	scope :tout_paiement_pv, -> { where("type_paiement = ?", 'pv') }
	scope :tout_paiement_pvr, -> { where("type_paiement = ?", 'pvr') }
	scope :tout_paiement_pa, -> { where("type_paiement = ?", 'pa') }
	scope :tout_paiement_par, -> { where("type_paiement = ?", 'par') }


	#####FOURNISSEUR####
	# TOUT LES PAIEMENTS EFFECTUER POUR FOURNISSEUR
	scope :tout_paiement_fournisseur, ->(fournisseur_id) { where("fournisseur_id = ?", fournisseur_id) }
	# TOTAL LES PAIEMENTS EFFECTUER POUR FOURNISSEUR
	scope :total_paiement_fournisseur, ->(fournisseur_id) { where("fournisseur_id = ?", fournisseur_id).sum('montant') }

	###BOUTIQUE####
	# TOUT LES PAIEMENTS EFFECTUER POUR BOUTIQUE
	scope :tout_paiement_boutique, ->(boutique_id) { where("boutique_id = ?", boutique_id) }
	# TOTAL LES PAIEMENTS EFFECTUER POUR BOUTIQUE
	scope :total_paiement_boutique, ->(boutique_id) { where("boutique_id = ?", boutique_id).sum('montant') }

	###CLIENT####
	# TOUT LES PAIEMENTS EFFECTUER POUR CLIENT
	scope :tout_paiement_client, ->(client_id) { where("client_id = ?", client_id) }
	# TOTAL LES PAIEMENTS EFFECTUER POUR CLIENT
	scope :total_paiement_client, ->(client_id) { where("client_id = ?", client_id).sum('montant') }

	###ACHAT####
	# TOUT LES PAIEMENTS EFFECTUER POUR ACHAT
	scope :tout_paiement_achat, ->(achat_id) { where("achat_id = ?", achat_id) }
	# TOTAL LES PAIEMENTS EFFECTUER POUR ACHAT
	scope :total_paiement_achat, ->(achat_id) { where("achat_id = ?", achat_id).sum('montant') }
	scope :atotal_paiement_achat, ->(achat_id, mont) { (mont).to_i + total_paiement_achat(achat_id).to_i }

	###VENTE####
	# TOUT LES PAIEMENTS EFFECTUER POUR VENTE
	scope :tout_paiement_vente, ->(type_paiement) { where("type_paiement = ?", type_paiement) }
	# TOTAL LES PAIEMENTS EFFECTUER POUR VENTE
	scope :total_paiement_vente, ->(type_paiement) { where("type_paiement = ?", type_paiement).sum('montant') }
	scope :vtotal_paiement_vente, ->(type_paiement, mont) { (mont).to_i + total_paiement_vente(type_paiement).to_i }

###PRESTATION####
	# TOUT LES PAIEMENTS EFFECTUER POUR PRESTATION
	scope :tout_paiement_prestation, ->(prestation_id) { where("prestation_id = ?", prestation_id)}
	# TOTAL LES PAIEMENTS EFFECTUER POUR PRESTATION
	scope :total_paiement_prestation, ->(prestation_id) { where("prestation_id = ?", prestation_id).sum('montant')}
	scope :ptotal_paiement_prestation, ->(prestation_id, mont) { (mont).to_i + total_paiement_prestation(prestation_id).to_i}



	before_save :verifier_paiement

	def verifier_paiement
		if type_paiement == 'pa' and Paiement.atotal_paiement_achat("#{achat_id}", "#{montant}") > achat.somme
			return false
		elsif type_paiement == 'par' and Paiement.vtotal_paiement_vente("#{vente_id}", "#{montant}") > vente.asomme
			return false
		elsif type_paiement == 'pv' and Paiement.vtotal_paiement_vente("#{vente_id}", "#{montant}") > Vente.facture_somme(vente_id)
			return false
		elsif type_paiement == 'pvr' and Paiement.vtotal_paiement_vente("#{vente_id}", "#{montant}") > Vente.facture_somme(vente_id)
			return false
		end
	end



end
