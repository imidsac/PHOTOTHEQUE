class JournaliersController < ApplicationController
  #load_and_authorize_resource
  def index
    @achats = Achat.select("achats.id,fournisseur_id,fournisseur_libre, name_company, nom, prenom, date_achat,somme, payee, etat_achat").journaliers
    @ventes = Vente.select("ventes.id,boutique_id,name, client_id,nom, prenom,client_libre, date_vente,somme, payee, etat_vente").journaliers
    @depenses = Depense.select("depenses.id, date_dep, depenses.description, categoriedep_id,beneficiere, categoriedeps.name, employe_id, employes.nom,employes.prenom, montant, etat_dep, tva").journaliers

    @depenses_total = Depense.journaliers_total

    @ventes_paiement = Paiement.select("paiements.id,ventes.id as vente_num, clients.nom as nom_cl, prenom, client_libre, banques.nom, banques.compte, motif, montant").journaliers_vente_client
    @achats_paiement = Paiement.select("paiements.id, name_company, fournisseur_libre, banques.nom, banques.compte, motif, montant").journaliers_achat

    @ventes_paiement_total = Paiement.journaliers_vente_total

    #@atotal = Achat.select("sum(somme) as total, sum(payee) as payee").journe_total
    @attotal = Achat.ttotal
    @aptotal = Achat.ptotal

    @vttotal = Vente.ttotal
    @vptotal = Vente.ptotal

    @dttotal = Depense.dep_total

  end

  def show

  end



end
