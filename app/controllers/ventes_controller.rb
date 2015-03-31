require "PdfA5p.rb"
require "ventes_pdf.rb"

class VentesController < ApplicationController
  load_and_authorize_resource
  before_action :set_vente, only: [:show, :edit, :update, :destroy]

  # GET /ventes
  # GET /ventes.json
  def index
    if params[:utf8]
      @ventes = Vente.date_between("#{params[:date1]}", "#{params[:date2]}")
    else
      @ventes = Vente.recent
    end
    @crediteurs_boutiques = Vente.credit_boutiques_fideles if params[:credits]
    @crediteurs_clients = Vente.credit_clients_fideles if params[:credits]
    @crediteurs_clients_libre = Vente.credit_clients_libres if params[:credits]

  end

  # GET /ventes/1
  # GET /ventes/1.json
  def show
    if @vente.boutique_id != -1 
      @bou = Boutique.select("id, name").find(@vente.boutique_id)
    else @vente.boutique_id = -1 
      @cli = Client.select("id,nom, prenom").find(@vente.client_id)
      #@reste = Vente.select('id,somme-payee as reste').where("client_id = ? and somme-payee > ? ", @cli.id, 0).order(date_vente: :asc)

    end
    

    if @vente.type_ve == 'C'
      @ventelignes = @vente.ventelignes.select("cadre_id,numerobaguete,qte,qtelivre,prix_u,montant,ventelignes.id, ventelignes.etat").cadre
    else
      @ventelignes = @vente.ventelignes.select("article_id,name,reference,qte,qtelivre,prix_u,montant, ventelignes.id, ventelignes.etat").article
    end
    @paiements = @vente.paiements.jointure_banque.jointure_vente.select(:nom,:compte, :datepaiement, :motif, :montant, :id ).order(datepaiement: :desc)

    #@ventelignes = @vente.ventelignes
    @venteligne = Venteligne.new(:vente => @vente)

    @paiement = Paiement.new(:vente => @vente, :client => @cli, :boutique => @bou)

    ##pdf
    respond_to do |format|
      format.html
      format.pdf do
        pdf = VentePdf.new(@vente, @ventelignes, @cli, @bou, view_context)
        send_data pdf.render,
                  filename: "vente_#{@vente.id}.pdf",
                  type: 'application/pdf'
        #,disposition: "inline"
      end
    end

  end

  # GET /ventes/new
  def new
    @vente = Vente.new
  end

  # GET /ventes/1/edit
  def edit
  end

  # POST /ventes
  # POST /ventes.json
  def create
    @vente = Vente.new(vente_params)

    respond_to do |format|
      if @vente.save
        format.html { redirect_to @vente}
        format.json { render :show, status: :created, location: @vente }
      else
        format.html { render :new }
        format.json { render json: @vente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ventes/1
  # PATCH/PUT /ventes/1.json
  def update
    respond_to do |format|
      if @vente.update(vente_params)
        format.html { redirect_to @vente, notice: 'Vente was successfully updated.' }
        format.json { render :show, status: :ok, location: @vente }
      else
        format.html { render :edit }
        format.json { render json: @vente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ventes/1
  # DELETE /ventes/1.json
  def destroy
    if params[:boutique_id]
      @vente.destroy
      respond_to do |format|
        format.html { redirect_to boutique_url(@vente.boutique_id, :factures_boutique => true), notice: 'Vente was successfully destroyed.' }
        format.json { head :no_content }
      end
    elsif params[:client_id]
      @vente.destroy
      respond_to do |format|
        format.html { redirect_to client_url(@vente.client_id, :factures_client => true), notice: 'Vente was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      @vente.destroy
      respond_to do |format|
        format.html { redirect_to ventes_url, notice: 'Vente was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  def valider
    @vente.update(valide: 'o')
    redirect_to @vente, notice: 'Commande est valider.'
  end

  def invalider
    @vente.update(valide: 'n')
    redirect_to @vente, notice: 'Commande est invalider.'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vente
      @vente = Vente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vente_params
      params.require(:vente).permit(:boutique_id, :client_id, :client_libre, :date_vente, :type_ve)
    end
  end
