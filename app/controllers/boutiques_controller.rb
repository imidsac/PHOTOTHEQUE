class BoutiquesController < ApplicationController
  load_and_authorize_resource
  before_action :set_boutique, only: [:show, :edit, :update, :destroy]

  # GET /boutiques
  # GET /boutiques.json
  def index
    @boutiques = Boutique.where("boutiques.id != ? ", -1)
  end

  # GET /boutiques/1
  # GET /boutiques/1.json
  def show
    @ventes = Vente.factures_boutique(@boutique.id)
    @paiements = Paiement.select(:nom,:compte, :datepaiement, :motif, :montant, :id ).jointure_banque.tout_paiement_boutique(@boutique.id)
  end

  # GET /boutiques/new
  def new
    @boutique = Boutique.new
  end

  # GET /boutiques/1/edit
  def edit
  end

  # POST /boutiques
  # POST /boutiques.json
  def create
    @boutique = Boutique.new(boutique_params)

    respond_to do |format|
      if @boutique.save
        format.html { redirect_to @boutique, notice: 'Boutique was successfully created.' }
        format.json { render :show, status: :created, location: @boutique }
      else
        format.html { render :new }
        format.json { render json: @boutique.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boutiques/1
  # PATCH/PUT /boutiques/1.json
  def update
    respond_to do |format|
      if @boutique.update(boutique_params)
        format.html { redirect_to @boutique, notice: 'Boutique was successfully updated.' }
        format.json { render :show, status: :ok, location: @boutique }
      else
        format.html { render :edit }
        format.json { render json: @boutique.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boutiques/1
  # DELETE /boutiques/1.json
  def destroy
    @boutique.destroy
    respond_to do |format|
      format.html { redirect_to boutiques_url, notice: 'Boutique was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_boutique
    @boutique = Boutique.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def boutique_params
    params.require(:boutique).permit(:name, :phone, :address)
  end
end
