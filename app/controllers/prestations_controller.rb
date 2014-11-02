class PrestationsController < ApplicationController
  before_action :set_prestation, only: [:show, :edit, :update, :destroy]

  # GET /prestations
  # GET /prestations.json
  def index
    @prestations = Prestation.all
    @prestations = @prestations.select("prestations.id,employe_id,employes.nom as em_nom,employes.prenom,client_id,client_libre, clients.nom as cl_nom, clients.prenom,type_pr, date_prestation,somme, payee, etat_prestation").joins(:client, :employe).order(date_prestation: :desc).limit(10)

  end

  # GET /prestations/1
  # GET /prestations/1.json
  def show
    @cli = Client.select("id,nom, prenom").find(@prestation.client_id)
    @emp = Employe.select("id,nom, prenom").find(@prestation.employe_id)

    @prestationlignes = @prestation.prestationlignes.select("cadre_id,numerobaguete,formatphoto_id,dimention, qte,qtelivre,prix_u,montant,prestationlignes.numero_prise,prestationlignes.type_pl, prestationlignes.id, prestationlignes.etat").joins(:cadre, :formatphoto)
    @prestationligne = Prestationligne.new(:prestation => @prestation)

    #@prestation_attachments = @prestation.prestation_attachments.all
    #@prestation_attachment = @prestation.prestation_attachments.build
  end


  
  def image

    @prestation_attachments = @prestation.prestation_attachments.select("prestation_id, photo").joins(:prestation_attachment)
    @prestation_attachment = PrestationAttachment.new(:prestation => @prestation)
  end

  # GET /prestations/new
  def new
    @prestation = Prestation.new
  end

  # GET /prestations/1/edit
  def edit
  end

  # POST /prestations
  # POST /prestations.json
  def create
    @prestation = Prestation.new(prestation_params)

    respond_to do |format|
      if @prestation.save
        format.html { redirect_to @prestation}
        format.json { render :show, status: :created, location: @prestation }
      else
        format.html { render :new }
        format.json { render json: @prestation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prestations/1
  # PATCH/PUT /prestations/1.json
  def update
    respond_to do |format|
      if @prestation.update(prestation_params)
        format.html { redirect_to @prestation, notice: 'Prestation was successfully updated.' }
        format.json { render :show, status: :ok, location: @prestation }
      else
        format.html { render :edit }
        format.json { render json: @prestation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prestations/1
  # DELETE /prestations/1.json
  def destroy
    @prestation.destroy
    respond_to do |format|
      format.html { redirect_to prestations_url, notice: 'Prestation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prestation
      @prestation = Prestation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prestation_params
      params.require(:prestation).permit(:type_pr,:client_id, :client_libre, :employe_id, :date_prestation, :etat_prestation, :somme, :payee)
    end
end
