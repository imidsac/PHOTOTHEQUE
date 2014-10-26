class CoffresController < ApplicationController
  before_action :set_coffre, only: [:show, :edit, :update, :destroy]

  # GET /coffres
  # GET /coffres.json
  def index
    @coffres = Coffre.all
  end

  # GET /coffres/1
  # GET /coffres/1.json
  def show
  end

  # GET /coffres/new
  def new
    @coffre = Coffre.new
  end

  # GET /coffres/1/edit
  def edit
  end

  # POST /coffres
  # POST /coffres.json
  def create
    @coffre = Coffre.new(coffre_params)

    respond_to do |format|
      if @coffre.save
        format.html { redirect_to @coffre, notice: 'Coffre was successfully created.' }
        format.json { render :show, status: :created, location: @coffre }
      else
        format.html { render :new }
        format.json { render json: @coffre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coffres/1
  # PATCH/PUT /coffres/1.json
  def update
    respond_to do |format|
      if @coffre.update(coffre_params)
        format.html { redirect_to @coffre, notice: 'Coffre was successfully updated.' }
        format.json { render :show, status: :ok, location: @coffre }
      else
        format.html { render :edit }
        format.json { render json: @coffre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coffres/1
  # DELETE /coffres/1.json
  def destroy
    @coffre.destroy
    respond_to do |format|
      format.html { redirect_to coffres_url, notice: 'Coffre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coffre
      @coffre = Coffre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coffre_params
      params.require(:coffre).permit(:paiement, :font)
    end
end
