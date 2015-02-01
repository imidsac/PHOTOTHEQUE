class PaiementsController < ApplicationController
  load_and_authorize_resource
  before_action :set_paiement, only: [:show, :edit, :update, :destroy]

  # GET /paiements
  # GET /paiements.json
  def index
    @paiements = Paiement.all
  end

  # GET /paiements/1
  # GET /paiements/1.json
  def show
  end

  # GET /paiements/new
  def new
    @paiement = Paiement.new
  end

  # GET /paiements/1/edit
  def edit
    if params[:achat_id]
      @achat = Achat.find(params[:achat_id])
    elsif params[:vente_id]
      @vente = Vente.find(params[:vente_id])
    elsif params[:fournisseur_id]
      @fournisseur = Fournisseur.find(params[:fournisseur_id])
    elsif params[:client_id]
      @client = Client.find(params[:client_id])
    elsif params[:boutique_id]
      @boutique = Boutique.find(params[:boutique_id])
    end

  end

  # POST /paiements
  # POST /paiements.json
  def create
    if params[:vente_id]

      @vente = Vente.find(params[:vente_id])
      @cli = @vente.client_id
      @paiement = @vente.paiements.new(paiement_params)

      respond_to do |format|
        if @paiement.save
          format.html { redirect_to @paiement.vente, notice: 'Paiement was successfully created.' }
          format.json { render :show, status: :created, location: @paiement }
        else
          format.html { redirect_to @paiement.vente, notice: 'Paiement no v created.' }
          format.json { render json: @paiement.errors, status: :unprocessable_entity }
        end
      end

      elsif params[:prestation_id]

        @prestation = Prestation.find(params[:prestation_id])
        @cli = @prestation.client_id
        @paiement = @prestation.paiements.new(paiement_params)

        respond_to do |format|
          if @paiement.save
            format.html { redirect_to @paiement.prestation, notice: 'Paiement was successfully created.' }
            format.json { render :show, status: :created, location: @paiement }
          else
            format.html { redirect_to @paiement.prestation, notice: 'Paiement no v created.' }
            format.json { render json: @paiement.errors, status: :unprocessable_entity }
          end
        end

    elsif params[:achat_id]
      @achat = Achat.find(params[:achat_id])
      #@montants = Paiement.total_paiement_achat(@achat.id)+params[:montant].to_i
      @paiement = @achat.paiements.new(paiement_params)

      respond_to do |format|

        if @paiement.save
          format.html { redirect_to @paiement.achat, notice: 'Paiement was successfully created.' }
          format.json { render :show, status: :created, location: @paiement }
        else
          format.html { redirect_to @paiement.achat, notice: 'Paiement no created.' }
          format.json { render json: @paiement.errors, status: :unprocessable_entity }
        end


      end

    else
      @paiement = Paiement.new(paiement_params)
      respond_to do |format|
        if @paiement.save
          format.html { redirect_to banques_path(:caisse => true), notice: 'Paiement was successfully created.' }
          format.json { render :show, status: :created, location: @paiement }
        else
          format.html { redirect_to banques_path(:caisse => true), notice: 'Paiement no created.' }
          format.json { render json: @paiement.errors, status: :unprocessable_entity }
        end

      end

    end
  end

  # PATCH/PUT /paiements/1
  # PATCH/PUT /paiements/1.json
  def update
    if params[:vente_id]
      @vente = Vente.find(params[:vente_id])
      @cli = @vente.client_id
      @paiement = @vente.paiements.update(paiement_params)

      respond_to do |format|
        #if @paiement.update(paiement_params)
        if @paiement.save
          format.html { redirect_to @paiement.vente, notice: 'Paiement was successfully updated.' }
          format.json { render :show, status: :ok, location: @paiement }
        else
          format.html { render :edit }
          format.json { render json: @paiement.errors, status: :unprocessable_entity }
        end
      end

      elsif params[:prestation_id]
        @prestation = Prestation.find(params[:prestation_id])
        @cli = @prestation.client_id
        @paiement = @prestation.paiements.update(paiement_params)

        respond_to do |format|
          #if @paiement.update(paiement_params)
          if @paiement.save
            format.html { redirect_to @paiement.prestation, notice: 'Paiement was successfully updated.' }
            format.json { render :show, status: :ok, location: @paiement }
          else
            format.html { render :edit }
            format.json { render json: @paiement.errors, status: :unprocessable_entity }
          end
        end

    elsif params[:achat_id]
      respond_to do |format|
        if @paiement.update(paiement_params)
          format.html { redirect_to @paiement.achat, notice: 'Paiement was successfully updated.' }
          format.json { render :show, status: :ok, location: @paiement }
        else
          format.html { render :edit }
          format.json { render json: @paiement.errors, status: :unprocessable_entity }
        end
      end

    elsif params[:fournisseur_id]
      @fou = Fournisseur.find(params[:fournisseur_id])
      respond_to do |format|
        if @paiement.update(paiement_params)
          format.html { redirect_to fournisseur_url(@fou.id, :tout_paiement_fournisseur => true), notice: 'Paiement was successfully updated.' }
          format.json { render :show, status: :ok, location: @paiement }
        else
          format.html { render :edit }
          format.json { render json: @paiement.errors, status: :unprocessable_entity }
        end
      end

    elsif params[:client_id]
      @client = Client.find(params[:client_id])
      respond_to do |format|
        if @paiement.update(paiement_params)
          format.html { redirect_to client_url(@client.id, :tout_paiement_client => true), notice: 'Paiement was successfully updated.' }
          format.json { render :show, status: :ok, location: @paiement }
        else
          format.html { render :edit }
          format.json { render json: @paiement.errors, status: :unprocessable_entity }
        end
      end

    elsif params[:boutique_id]
      @boutique = Boutique.find(params[:boutique_id])
      respond_to do |format|
        if @paiement.update(paiement_params)
          format.html { redirect_to boutique_url(@boutique.id, :tout_paiement_boutique => true), notice: 'Paiement was successfully updated.' }
          format.json { render :show, status: :ok, location: @paiement }
        else
          format.html { render :edit }
          format.json { render json: @paiement.errors, status: :unprocessable_entity }
        end
      end

    end

  end

  # DELETE /paiements/1
  # DELETE /paiements/1.json
  def destroy
    if params[:vente_id]
      @paiement.destroy
      respond_to do |format|
        format.html { redirect_to @paiement.vente, notice: 'Paiement was successfully destroyed.' }
        format.json { head :no_content }
      end

    elsif params[:prestation_id]
      @paiement.destroy
      respond_to do |format|
        format.html { redirect_to @paiement.prestation, notice: 'Paiement was successfully destroyed.' }
        format.json { head :no_content }
      end


      elsif params[:achat_id]
      @paiement.destroy
      respond_to do |format|
        format.html { redirect_to @paiement.achat, notice: 'Paiement was successfully destroyed.' }
        format.json { head :no_content }
      end

    elsif params[:fournisseur_id]
      @fou = Fournisseur.find(params[:fournisseur_id])
      @paiement.destroy
      respond_to do |format|
        format.html { redirect_to fournisseur_path(@fou.id, :tout_paiement_fournisseur => true), notice: 'Paiement was successfully destroyed.' }
        format.json { head :no_content }
      end

    elsif params[:client_id]
      @client = Client.find(params[:client_id])
      @paiement.destroy
      respond_to do |format|
        format.html { redirect_to client_path(@client.id, :tout_paiement_client => true), notice: 'Paiement was successfully destroyed.' }
        format.json { head :no_content }
      end


    elsif params[:boutique_id]
      @boutique = Boutique.find(params[:boutique_id])
      @paiement.destroy
      respond_to do |format|
        format.html { redirect_to boutique_path(@boutique.id, :tout_paiement_boutique => true), notice: 'Paiement was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_paiement
    @paiement = Paiement.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def paiement_params
    params.require(:paiement).permit(:vente_id, :prestation_id, :boutique_id, :client_id, :achat_id, :banque_id, :fournisseur_id, :datepaiement, :motif, :montant, :type_paiement)
  end
end
