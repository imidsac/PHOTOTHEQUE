class DepensesController < ApplicationController
  load_and_authorize_resource
  before_action :set_depense, only: [:show, :edit, :update, :destroy]

  # GET /depenses
  # GET /depenses.json
  def index
    @depenses = Depense.all
    @depenses = @depenses.select("depenses.id, date_dep, depenses.description, categoriedep_id,beneficiere, categoriedeps.name, employe_id, employes.nom,employes.prenom, montant, etat_dep, tva").recent
    @depenses = @depenses.select("depenses.id, date_dep, depenses.description, employe_id, employes.nom,employes.prenom, montant, etat_dep, tva").joins(:employe).avant_salaire if params[:avant_salaire]

  end

  # GET /depenses/1
  # GET /depenses/1.json
  def show

    @cat = Categoriedep.select("id, name").find(@depense.categoriedep_id)

    @em = Employe.select("id,nom, prenom").find(@depense.employe_id)

  end

  # GET /depenses/new
  def new
    @depense = Depense.new
  end

  # GET /depenses/1/edit
  def edit
  end

  # POST /depenses
  # POST /depenses.json
  def create
    @depense = Depense.new(depense_params)

    respond_to do |format|
      if @depense.save
        format.html { redirect_to @depense, notice: 'Depense was successfully created.' }
        format.json { render :show, status: :created, location: @depense }
      else
        format.html { render :new }
        format.json { render json: @depense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /depenses/1
  # PATCH/PUT /depenses/1.json
  def update
    respond_to do |format|
      if @depense.update(depense_params)
        format.html { redirect_to @depense, notice: 'Depense was successfully updated.' }
        format.json { render :show, status: :ok, location: @depense }
      else
        format.html { render :edit }
        format.json { render json: @depense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /depenses/1
  # DELETE /depenses/1.json
  def destroy
    @depense.destroy
    respond_to do |format|
      format.html { redirect_to depenses_url, notice: 'Depense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_depense
    @depense = Depense.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def depense_params
    params.require(:depense).permit(:date_dep,:beneficiere, :description, :categoriedep_id,:employe_id, :montant)
  end
end
