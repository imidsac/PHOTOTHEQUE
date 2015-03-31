class JournaliersController < ApplicationController
  #load_and_authorize_resource
  def index
    if params[:utf8]
      @achats = Achat.list.date_between("#{params[:date1]}", "#{params[:date2]}")
      @ventes = Vente.list.date_between("#{params[:date1]}", "#{params[:date2]}")
      @ventes = Prestation.list.date_between("#{params[:date1]}", "#{params[:date2]}")
      @depenses = Depense.list.date_between("#{params[:date1]}", "#{params[:date2]}")

      #@boutiques_paiement = Paiement.journaliers_vente_boutique
      @ventes_paiement = Paiement.date_between_vente("#{params[:date1]}", "#{params[:date2]}")
      #@achats_paiement = Paiement.tout_paiement_pa.date_between_achat("#{params[:date1]}", "#{params[:date2]}")


      @ventes_paiement_total = Paiement.tout_paiement_pv.date_between_vente_total("#{params[:date1]}", "#{params[:date2]}")
      @depenses_total = Depense.date_between_depense_total("#{params[:date1]}", "#{params[:date2]}")
      @achats_paiement_total = Paiement.date_between_achat_total("#{params[:date1]}", "#{params[:date2]}")

      @attotal = Achat.date_between_total("#{params[:date1]}", "#{params[:date2]}")
      @arttotal = Retourelog.acttotal
      @aptotal = Achat.date_between_payee("#{params[:date1]}", "#{params[:date2]}")
      @arptotal = Paiement.date_between_acptotal("#{params[:date1]}", "#{params[:date2]}")

      @vttotal = Vente.date_between_total("#{params[:date1]}", "#{params[:date2]}")
      @vrttotal = Retourelog.attotal
      @vptotal = Vente.date_between_payee("#{params[:date1]}", "#{params[:date2]}")
      @vrptotal = Paiement.date_between_aptotal("#{params[:date1]}", "#{params[:date2]}")

      @dttotal = Depense.date_between_total("#{params[:date1]}", "#{params[:date2]}")
    else
      @achats = Achat.list.journaliers
      @ventes = Vente.list.journaliers
      @prestations = Prestation.list.journaliers
      @depenses = Depense.list.journaliers
      @ventes_paiement = Paiement.journaliers

      @depenses_total = Depense.journaliers_total
      @ventes_paiement_total = Paiement.journaliers_vente_total
      @prestations_paiement_total = Paiement.journaliers_prestation_total
      @boutiques_paiement_total = Paiement.journaliers_boutique_total
      @achats_paiement_total = Paiement.journaliers_achat_total

      #@atotal = Achat.select("sum(somme) as total, sum(payee) as payee").journe_total
      @attotal = Achat.ttotal
      @arttotal = Retourelog.acttotal
      @aptotal = Achat.ptotal
      @arptotal = Paiement.acptotal

      @vttotal = Vente.ttotal
      @vrttotal = Retourelog.attotal
      @vptotal = Vente.ptotal
      @vrptotal = Paiement.aptotal

      @dttotal = Depense.dep_total
    end

  end

  def show

  end



end
