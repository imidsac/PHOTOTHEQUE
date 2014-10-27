class AchatsController < ApplicationController
  before_action :set_achat, only: [:show, :edit, :update, :destroy]

  # GET /achats
  # GET /achats.json
  def index
    @achats = Achat
    @achats = @achats.order(date_achat: :desc).article if params[:article]
    @achats = @achats.order(date_achat: :desc).cadre if params[:cadre]
    @achats = @achats.order(date_achat: :desc).payee if params[:payee]
    @achats = @achats.order(date_achat: :desc).nopayee if params[:nopayee]
    #@achats = @achats.order(date_achat: :desc).limit(10)
    @achats = @achats.select("achats.id,fournisseur_id, name_company, nom, prenom,type_ac, date_achat,somme, payee, etat_achat").joins(:fournisseur).order(date_achat: :desc)

    #@cadres = Cadre.joins(" JOIN formatcadres ON formatcadres.id = cadres.formatcadre_id")

  end

  # GET /achats/1
  # GET /achats/1.json
  def show
    @alignes = @achat.alignes
    @aligne = Aligne.new(:achat => @achat)
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_achat
      @achat = Achat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def achat_params
      params.require(:achat).permit(:fournisseur_id, :date_achat, :type_ac, :somme, :payee, :etat_achat)
    end
end
