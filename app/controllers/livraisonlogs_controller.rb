class LivraisonlogsController < ApplicationController
  before_action :set_livraisonlog, only: [:show, :edit, :update, :destroy]

  # GET /livraisonlogs
  # GET /livraisonlogs.json
  def index
    @livraisonlogs = Livraisonlog.all
  end

  # GET /livraisonlogs/1
  # GET /livraisonlogs/1.json
  def show
  end

  # GET /livraisonlogs/new
  def new
    @livraisonlog = Livraisonlog.new
  end

  # GET /livraisonlogs/1/edit
  def edit
  end

  # POST /livraisonlogs
  # POST /livraisonlogs.json
  def create
    @livraisonlog = Livraisonlog.new(livraisonlog_params)

    respond_to do |format|
      if @livraisonlog.save
        format.html { redirect_to @livraisonlog, notice: 'Livraisonlog was successfully created.' }
        format.json { render :show, status: :created, location: @livraisonlog }
      else
        format.html { render :new }
        format.json { render json: @livraisonlog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /livraisonlogs/1
  # PATCH/PUT /livraisonlogs/1.json
  def update
    respond_to do |format|
      if @livraisonlog.update(livraisonlog_params)
        format.html { redirect_to @livraisonlog, notice: 'Livraisonlog was successfully updated.' }
        format.json { render :show, status: :ok, location: @livraisonlog }
      else
        format.html { render :edit }
        format.json { render json: @livraisonlog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /livraisonlogs/1
  # DELETE /livraisonlogs/1.json
  def destroy
    @livraisonlog.destroy
    respond_to do |format|
      format.html { redirect_to livraisonlogs_url, notice: 'Livraisonlog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_livraisonlog
      @livraisonlog = Livraisonlog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def livraisonlog_params
      params.require(:livraisonlog).permit(:date_liv, :achat_id, :produit_id, :qte, :vente_id, :etat, :user_id)
    end
end
