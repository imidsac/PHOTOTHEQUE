class JournaliersController < ApplicationController
  #load_and_authorize_resource
  def index
    @achats = Achat.select("achats.id,fournisseur_id,fournisseur_libre, name_company, nom, prenom, date_achat,somme, payee, etat_achat").journaliers
    @ventes = Vente.select("ventes.id,boutique_id,name, client_id,nom, prenom,client_libre, date_vente,somme, payee, etat_vente").journaliers
    @prestations = Prestation.select("prestations.id,employe_id,employes.nom as em_nom, employes.prenom as em_prenom, client_id,clients.nom, clients.prenom,client_libre,type_pr, date_prestation,somme, payee, etat_prestation").journaliers
    @depenses = Depense.select("depenses.id, date_dep, depenses.description, categoriedep_id,beneficiere, categoriedeps.name, employe_id, employes.nom,employes.prenom, montant, etat_dep, tva").journaliers

    @depenses_total = Depense.journaliers_total

    @ventes_paiement = Paiement.select("type_paiement, paiements.id,vente_id as vente_num, name, clients.nom as nom_cl, prenom, client_libre, banques.nom, banques.compte, motif, montant").journaliers_vente
    @prestations_paiement = Paiement.select("paiements.id,prestation_id as prestations_num, clients.nom as nom_cl, clients.prenom as prenom_cl, client_libre, banques.nom, banques.compte, motif, montant").journaliers_prestation_client
    @achats_paiement = Paiement.select("paiements.id, name_company, fournisseur_libre, banques.nom, banques.compte, motif, montant").journaliers_achat_fournisseur

    @ventes_paiement_total = Paiement.journaliers_vente_total
    @prestations_paiement_total = Paiement.journaliers_prestation_total
    @boutiques_paiement_total = Paiement.journaliers_boutique_total
    @achats_paiement_total = Paiement.journaliers_achat_total

    #@atotal = Achat.select("sum(somme) as total, sum(payee) as payee").journe_total
    @attotal = Achat.ttotal
    @aptotal = Achat.ptotal

    @vttotal = Vente.ttotal
    @vptotal = Vente.ptotal

    @pttotal = Prestation.ttotal
    @pptotal = Prestation.ptotal

    @dttotal = Depense.dep_total

  end

  def show

  end



end
