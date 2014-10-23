class VentelignesController < ApplicationController
  before_action :set_venteligne, only: [:show, :edit, :update, :destroy]

  # GET /ventelignes
  # GET /ventelignes.json
  def index
    @ventelignes = Venteligne.all
  end

  # GET /ventelignes/1
  # GET /ventelignes/1.json
  def show
  end

  # GET /ventelignes/new
  def new
    @venteligne = Venteligne.new
  end

  # GET /ventelignes/1/edit
  def edit
  end

  # POST /ventelignes
  # POST /ventelignes.json
  def create
    @venteligne = Venteligne.new(venteligne_params)

    respond_to do |format|
      if @venteligne.save
        format.html { redirect_to @venteligne, notice: 'Venteligne was successfully created.' }
        format.json { render :show, status: :created, location: @venteligne }
      else
        format.html { render :new }
        format.json { render json: @venteligne.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ventelignes/1
  # PATCH/PUT /ventelignes/1.json
  def update
    respond_to do |format|
      if @venteligne.update(venteligne_params)
        format.html { redirect_to @venteligne, notice: 'Venteligne was successfully updated.' }
        format.json { render :show, status: :ok, location: @venteligne }
      else
        format.html { render :edit }
        format.json { render json: @venteligne.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ventelignes/1
  # DELETE /ventelignes/1.json
  def destroy
    @venteligne.destroy
    respond_to do |format|
      format.html { redirect_to ventelignes_url, notice: 'Venteligne was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venteligne
      @venteligne = Venteligne.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venteligne_params
      params.require(:venteligne).permit(:vente_id, :qte, :qtelivre, :montant, :etat)
    end
end
