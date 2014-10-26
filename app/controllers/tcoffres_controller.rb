class TcoffresController < ApplicationController
  before_action :set_tcoffre, only: [:show, :edit, :update, :destroy]

  # GET /tcoffres
  # GET /tcoffres.json
  def index
    @tcoffres = Tcoffre.all
  end

  # GET /tcoffres/1
  # GET /tcoffres/1.json
  def show
  end

  # GET /tcoffres/new
  def new
    @tcoffre = Tcoffre.new
  end

  # GET /tcoffres/1/edit
  def edit
  end

  # POST /tcoffres
  # POST /tcoffres.json
  def create
    @tcoffre = Tcoffre.new(tcoffre_params)

    respond_to do |format|
      if @tcoffre.save
        format.html { redirect_to @tcoffre, notice: 'Tcoffre was successfully created.' }
        format.json { render :show, status: :created, location: @tcoffre }
      else
        format.html { render :new }
        format.json { render json: @tcoffre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tcoffres/1
  # PATCH/PUT /tcoffres/1.json
  def update
    respond_to do |format|
      if @tcoffre.update(tcoffre_params)
        format.html { redirect_to @tcoffre, notice: 'Tcoffre was successfully updated.' }
        format.json { render :show, status: :ok, location: @tcoffre }
      else
        format.html { render :edit }
        format.json { render json: @tcoffre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tcoffres/1
  # DELETE /tcoffres/1.json
  def destroy
    @tcoffre.destroy
    respond_to do |format|
      format.html { redirect_to tcoffres_url, notice: 'Tcoffre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tcoffre
      @tcoffre = Tcoffre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tcoffre_params
      params.require(:tcoffre).permit(:date_tc, :beneficier, :type_tc)
    end
end
