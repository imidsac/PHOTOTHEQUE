class CaissesController < ApplicationController
  before_action :set_caiss, only: [:show, :edit, :update, :destroy]

  # GET /caisses
  # GET /caisses.json
  def index
    @caisses = Caisse.all
  end

  # GET /caisses/1
  # GET /caisses/1.json
  def show
  end

  # GET /caisses/new
  def new
    @caiss = Caisse.new
  end

  # GET /caisses/1/edit
  def edit
  end

  # POST /caisses
  # POST /caisses.json
  def create
    @caiss = Caisse.new(caiss_params)

    respond_to do |format|
      if @caiss.save
        format.html { redirect_to @caiss, notice: 'Caisse was successfully created.' }
        format.json { render :show, status: :created, location: @caiss }
      else
        format.html { render :new }
        format.json { render json: @caiss.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caisses/1
  # PATCH/PUT /caisses/1.json
  def update
    respond_to do |format|
      if @caiss.update(caiss_params)
        format.html { redirect_to @caiss, notice: 'Caisse was successfully updated.' }
        format.json { render :show, status: :ok, location: @caiss }
      else
        format.html { render :edit }
        format.json { render json: @caiss.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caisses/1
  # DELETE /caisses/1.json
  def destroy
    @caiss.destroy
    respond_to do |format|
      format.html { redirect_to caisses_url, notice: 'Caisse was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caiss
      @caiss = Caisse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caiss_params
      params.require(:caiss).permit(:paiement, :font)
    end
end
