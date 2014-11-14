class Paiement < ActiveRecord::Base
	belongs_to :boutique
	belongs_to :vente
	belongs_to :prestation
	belongs_to :client
	belongs_to :achat
	belongs_to :fournisseur

	after_save :give_payee_vente
	#after_save  :total
	#after_save :total
	#after_destroy :total


  def give_payee_vente
  	if vente_id
	vente.payee += montant
	vente.save
	#@co = Coffre.all
  	#@co.paiement += montant
  	#@co.save
  	elsif achat_id
	achat.payee += montant
	achat.save
  		
  	elsif prestation_id
	prestation.payee += montant
	prestation.save
  		
  	end
  end
  


end
