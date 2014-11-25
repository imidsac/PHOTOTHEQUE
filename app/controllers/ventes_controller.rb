class VentesController < ApplicationController
  before_action :set_vente, only: [:show, :edit, :update, :destroy]

  # GET /ventes
  # GET /ventes.json
  def index
    @ventes = Vente.all
    @ventes = @ventes.order(date_vente: :desc).article if params[:article]
    @ventes = @ventes.order(date_vente: :desc).cadre if params[:cadre]
    @ventes = @ventes.order(date_vente: :desc).payee if params[:payee]
    @ventes = @ventes.order(date_vente: :desc).nopayee if params[:nopayee]

    @ventes = @ventes.select("ventes.id,boutique_id,name, client_id,nom, prenom,type_ve,client_libre, date_vente,somme, payee, etat_vente").joins(:client, :boutique).order(date_vente: :desc)

  end

  # GET /ventes/1
  # GET /ventes/1.json
  def show
    if @vente.boutique_id != -1 
      @bou = Boutique.select("id, name").find(@vente.boutique_id)
    else @vente.boutique_id = -1 
      @cli = Client.select("id,nom, prenom").find(@vente.client_id)
      #@reste = Vente.select('id,somme-payee as reste').where("client_id = ? and somme-payee > ? ", @cli.id, 0).order(date_vente: :asc)

    end
    

    if @vente.type_ve == 'C'
      @ventelignes = @vente.ventelignes.select("cadre_id,numerobaguete,qte,qtelivre,prix_u,montant,ventelignes.id, ventelignes.etat").joins(:cadre)
    else
      @ventelignes = @vente.ventelignes.select("article_id,name,reference,qte,qtelivre,prix_u,montant, ventelignes.id, ventelignes.etat").joins(:article)
    end
    #@ventelignes = @vente.ventelignes
    @venteligne = Venteligne.new(:vente => @vente)

    @paiement = Paiement.new(:vente => @vente, :client => @cli, :boutique => @bou)


  end

  # GET /ventes/new
  def new
    @vente = Vente.new
  end

  # GET /ventes/1/edit
  def edit
  end

  # POST /ventes
  # POST /ventes.json
  def create
    @vente = Vente.new(vente_params)

    respond_to do |format|
      if @vente.save
        format.html { redirect_to @vente}
        format.json { render :show, status: :created, location: @vente }
      else
        format.html { render :new }
        format.json { render json: @vente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ventes/1
  # PATCH/PUT /ventes/1.json
  def update
    respond_to do |format|
      if @vente.update(vente_params)
        format.html { redirect_to @vente, notice: 'Vente was successfully updated.' }
        format.json { render :show, status: :ok, location: @vente }
      else
        format.html { render :edit }
        format.json { render json: @vente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ventes/1
  # DELETE /ventes/1.json
  def destroy
    @vente.destroy
    respond_to do |format|
      format.html { redirect_to ventes_url, notice: 'Vente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vente
      @vente = Vente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vente_params
      params.require(:vente).permit(:boutique_id, :client_id, :client_libre, :date_vente, :etat_vente, :somme, :payee, :type_ve, :etat_vente)
    end
  end
