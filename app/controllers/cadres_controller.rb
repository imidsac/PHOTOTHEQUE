class CadresController < ApplicationController
  before_action :set_cadre, only: [:show, :edit, :update, :destroy]

  # GET /cadres
  # GET /cadres.json
  def index
    #@cadres = Cadre.where("id != ?", -1)
    @q = Cadre.search(params[:q])
    @cadres = @q.result(distinct: true)
  end

  # GET /cadres/1
  # GET /cadres/1.json
  def show
  end

  # GET /cadres/new
  def new
    @cadre = Cadre.new
  end

  # GET /cadres/1/edit
  def edit
  end

  # POST /cadres
  # POST /cadres.json
  def create
    @cadre = Cadre.new(cadre_params)

    respond_to do |format|
      if @cadre.save
        format.html { redirect_to @cadre, notice: 'Cadre was successfully created.' }
        format.json { render :show, status: :created, location: @cadre }
      else
        format.html { render :new }
        format.json { render json: @cadre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cadres/1
  # PATCH/PUT /cadres/1.json
  def update
    respond_to do |format|
      if @cadre.update(cadre_params)
        format.html { redirect_to @cadre, notice: 'Cadre was successfully updated.' }
        format.json { render :show, status: :ok, location: @cadre }
      else
        format.html { render :edit }
        format.json { render json: @cadre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cadres/1
  # DELETE /cadres/1.json
  def destroy
    @cadre.destroy
    respond_to do |format|
      format.html { redirect_to cadres_url, notice: 'Cadre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cadre
      @cadre = Cadre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cadre_params
      params.require(:cadre).permit(:numerobaguete, :info)
    end
end
