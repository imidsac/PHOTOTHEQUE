require "PdfA4l.rb"
require "achats_pdf.rb"

class AchatsController < ApplicationController
  load_and_authorize_resource
  before_action :set_achat, only: [:show, :edit, :update, :destroy]

  # GET /achats
  # GET /achats.json
  def index
    @achats = Achat.all
    @achats = @achats.select("achats.id,fournisseur_id,fournisseur_libre, name_company, nom, prenom,type_ac, date_achat,somme, payee, etat_achat").recent.order(date_achat: :desc)

  end

  # GET /achats/1
  # GET /achats/1.json
  def show
    @fourni = Fournisseur.select("fournisseurs.id, name_company, nom, prenom").find(@achat.fournisseur_id)
    @monait = Monetaire.select("code_money, money, valeur").find(@achat.monetaire_id)

    if @achat.type_ac == 'C'
    @alignes = @achat.alignes.select("cadre_id,numerobaguete,qte,qtelivre,prix_u,montant, alignes.id, alignes.etat").cadre
    @total_detail = @achat.alignes.montant_detail_cadre
    @total_gros = @achat.alignes.montant_gros_cadre
    else
    @alignes = @achat.alignes.select("article_id,name,reference,qte,qtelivre,prix_u,montant, alignes.id, alignes.etat, alignes.achat_id").article
    @total_detail = @achat.alignes.montant_detail_article
    @total_gros = @achat.alignes.montant_gros_article
    end

    @paiements = @achat.paiements.jointure_banque.jointure_achat.select(:nom,:compte, :datepaiement, :motif, :montant, :id ).order(datepaiement: :desc)



    #@alignes = @achat.alignes
    @aligne = Aligne.new(:achat => @achat)

    @paiement = Paiement.new(:achat => @achat, :fournisseur => @fourni)

    ##pdf
    respond_to do |format|
      format.html
      format.pdf do
        pdf = AchatPdf.new(@achat, @alignes, @fourni, @total_gros, @total_detail, @monait, view_context)
        send_data pdf.render,
                  filename: "achat_#{@achat.id}.pdf",
                  type: 'application/pdf'
        #,disposition: "inline"
      end
    end

  end

  # GET /achats/new
  def new
    @achat = Achat.new
  end

  # GET /achats/1/edit
  def edit
  end

  # POST /achats
  # POST /achats.json
  def create
    @achat = Achat.new(achat_params)

    respond_to do |format|
      if @achat.save
        format.html { redirect_to @achat }
        format.json { render :show, status: :created, location: @achat }
      else
        format.html { render :new }
        format.json { render json: @achat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /achats/1
  # PATCH/PUT /achats/1.json
  def update
    respond_to do |format|
      if @achat.update(achat_params)
        format.html { redirect_to @achat, notice: 'Achat was successfully updated.' }
        format.json { render :show, status: :ok, location: @achat }
      else
        format.html { render :edit }
        format.json { render json: @achat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /achats/1
  # DELETE /achats/1.json
  def destroy
    @achat.destroy
    respond_to do |format|
      format.html { redirect_to achats_url, notice: 'Achat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def valider
    @achat.update(valide: 'o')
    redirect_to @achat, notice: 'Commande est valider.'
  end

  def invalider
    @achat.update(valide: 'n')
    redirect_to @achat, notice: 'Commande est invalider.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_achat
      @achat = Achat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def achat_params
      params.require(:achat).permit(:fournisseur_id, :fournisseur_libre, :date_achat, :type_ac, :num_ac, :monetaire_id, :retoure, :user_id)
    end
end
