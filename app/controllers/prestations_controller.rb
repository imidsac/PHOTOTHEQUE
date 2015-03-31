require "PdfA5p.rb"
#require "prestations_pdf.rb"
require 'prestation_pdf.rb'
class PrestationsController < ApplicationController
  load_and_authorize_resource
  before_action :set_prestation, only: [:show, :edit, :update, :destroy]
        
  # GET /prestations
  # GET /prestations.json
  def index
    if params[:utf8]
      @prestations = Prestation.date_between("#{params[:date1]}", "#{params[:date2]}")
    else
      @prestations = Prestation.recent
    end
    @crediteurs_clients = Prestation.credit_clients_fideles if params[:credits]
    @crediteurs_clients_libre = Prestation.credit_clients_libres if params[:credits]

    ##pdf
    respond_to do |format|
      format.html
      format.pdf do
        pdf = PresPdf.new(@prestations)
        send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
      end
    end

  end

  # GET /prestations/1
  # GET /prestations/1.json
  def show
    @cli = Client.select("clients.id,nom, prenom").find(@prestation.client_id)
    @emp = Employe.select("id,nom, prenom").find(@prestation.employe_id)

    @prestationlignes = @prestation.prestationlignes.select("color,cadre_id,numerobaguete,formatphoto_id,dimention, qte,qtelivre,prix_u,montant,prestationlignes.numero_prise,prestationlignes.type_pl, prestationlignes.id, prestationlignes.etat").joins(:cadre, :formatphoto)
    @paiements = @prestation.paiements.jointure_banque.jointure_prestation.select(:nom,:compte, :datepaiement, :motif, :montant, :id ).order(datepaiement: :desc)


    @prestationligne = Prestationligne.new(:prestation => @prestation)
    @paiement = Paiement.new(:prestation => @prestation, :client => @cli)

    #@prestation_attachments = @prestation.prestation_attachments.all
    #@prestation_attachment = @prestation.prestation_attachments.build

    ##pdf
    respond_to do |format|
      format.html
      format.pdf do
        pdf = PresPdf.new(@prestation, @prestationlignes, @cli)
        send_data pdf.render, 
        filename: 'report.pdf', 
        type: 'application/pdf',
        disposition: "inline"
      end
    end
    
  end


  
  def image

    @prestation_attachments = @prestation.prestation_attachments.select("prestation_id, photo").joins(:prestation_attachment)
    @prestation_attachment = PrestationAttachment.new(:prestation => @prestation)
  end

  # GET /prestations/new
  def new
    @prestation = Prestation.new
  end

  # GET /prestations/1/edit
  def edit
  end

  # POST /prestations
  # POST /prestations.json
  def create
    @prestation = Prestation.new(prestation_params)

    respond_to do |format|
      if @prestation.save
        format.html { redirect_to @prestation}
        format.json { render :show, status: :created, location: @prestation }
      else
        format.html { render :new }
        format.json { render json: @prestation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prestations/1
  # PATCH/PUT /prestations/1.json
  def update
    respond_to do |format|
      if @prestation.update(prestation_params)
        format.html { redirect_to @prestation, notice: 'Prestation was successfully updated.' }
        format.json { render :show, status: :ok, location: @prestation }
      else
        format.html { render :edit }
        format.json { render json: @prestation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prestations/1
  # DELETE /prestations/1.json
  def destroy
  if params[:client_id]
    @prestation.destroy
    respond_to do |format|
      format.html { redirect_to client_url(@prestation.client_id, :factures_client => true), notice: 'Prestation was successfully destroyed.' }
      format.json { head :no_content }
    end
  else
    @prestation.destroy
    respond_to do |format|
      format.html { redirect_to prestations_url, notice: 'Prestation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  end

  def valider
    @prestation.update(valide: 'o')
    redirect_to @prestation, notice: 'Commande est valider.'
  end

  def invalider
    @prestation.update(valide: 'n')
    redirect_to @prestation, notice: 'Commande est invalider.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prestation
      @prestation = Prestation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prestation_params
      params.require(:prestation).permit(:type_pr,:client_id, :client_libre, :employe_id, :date_prestation)
    end
  end
