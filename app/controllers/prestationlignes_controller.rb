class PrestationlignesController < ApplicationController
  before_action :set_prestationligne, only: [:show, :edit, :update, :destroy]

  # GET /prestationlignes
  # GET /prestationlignes.json
  def index
    @prestationlignes = Prestationligne.all
    @prestation = Prestation.find(params[:id])
  end

  # GET /prestationlignes/1
  # GET /prestationlignes/1.json
  def show
    @prestation = Prestation.find(params[:id])
  end

  # GET /prestationlignes/new
  def new
    @prestationligne = Prestationligne.new
  end

  # GET /prestationlignes/1/edit
  def edit
    @prestation = Prestation.find(params[:prestation_id])
  end

  # POST /prestationlignes
  # POST /prestationlignes.json
  def create
    @prestation = Prestation.find(params[:prestation_id])
    @prestationligne = @prestation.prestationlignes.new(prestationligne_params)

    respond_to do |format|
      if @prestationligne.save
        format.html { redirect_to @prestationligne.prestation }
        format.json { render :show, status: :created, location: @prestationligne }
      else
        format.html { render :new }
        format.json { render json: @prestationligne.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prestationlignes/1
  # PATCH/PUT /prestationlignes/1.json
  def update
    @prestation = Prestation.find(params[:prestation_id])

    respond_to do |format|
      if @prestationligne.update(prestationligne_params)
        format.html { redirect_to @prestationligne.prestation, notice: 'Prestationligne was successfully updated.' }
        format.json { render :show, status: :ok, location: @prestationligne }
      else
        format.html { render :edit }
        format.json { render json: @prestationligne.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prestationlignes/1
  # DELETE /prestationlignes/1.json
  def destroy
    @prestationligne.destroy
    respond_to do |format|
      format.html { redirect_to @prestationligne.prestation, notice: 'Prestationligne was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prestationligne
      @prestationligne = Prestationligne.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prestationligne_params
      params.require(:prestationligne).permit(:formatphoto_id, :cadre_id, :qte, :qtelivre, :prix_u, :numero_prise, :type_pl, :color, :etat)
    end
  end
