class PaiementsController < ApplicationController
  before_action :set_paiement, only: [:show, :edit, :update, :destroy]

# GET /paiements
# GET /paiements.json
def index
  @paiements = Paiement.all
end

# GET /paiements/1
# GET /paiements/1.json
def show
end

# GET /paiements/new
def new
  @paiement = Paiement.new
  @resteclient = Vente.select('id,somme-payee as reste').where("client_id = ? and somme-payee > ? ", @vente.client_id, 0).order(date_vente: :asc)

end

# GET /paiements/1/edit
def edit
end

# POST /paiements
# POST /paiements.json
def create
  if params[:prestation_id]
    
    @prestation = Prestation.find(params[:prestation_id])
    @cli = @prestation.client_id
    @paiement = @prestation.paiements.new(paiement_params)

    respond_to do |format|
      if @paiement.save
        format.html { redirect_to @paiement.prestation, notice: 'Paiement was successfully created.' }
        format.json { render :show, status: :created, location: @paiement }
      else
        format.html { render :new }
        format.json { render json: @paiement.errors, status: :unprocessable_entity }
      end
    end
    
  elsif params[:achat_id]
    @achat = Achat.find(params[:achat_id])
      #@cli = @achat.client_id
      @paiement = @achat.paiements.new(paiement_params)

      respond_to do |format|
        if @paiement.save
          format.html { redirect_to @paiement.achat, notice: 'Paiement was successfully created.' }
          format.json { render :show, status: :created, location: @paiement }
        else
          format.html { render :new }
          format.json { render json: @paiement.errors, status: :unprocessable_entity }
        end
      end

    elsif params[:vente_id]
      @vente = Vente.find(params[:vente_id])
      @resteclients = Vente.select('id,somme-payee as reste').where("client_id = ? ", @vente.client_id).order(date_vente: :asc)
      #@resteclient = Vente.select('id,somme-payee as reste').sum('somme')
      #@montant = params[:montant]
      if params[:vente_id] != -1
      end

      #if @reste_client<params[:montant] 
=begin
      loop do
        while params[:client_id] = @reste_client.client_id do
            @paiement = @vente.paiements.create!(:client_id => @reste_client.id)
        end
      end 
=end
      #end
            @paiement = @vente.paiements.new(paiement_params)

      respond_to do |format|
        if @paiement.save          
          format.html { redirect_to @paiement.vente, notice: 'Paiement was successfully created.' }
          format.json { render :show, status: :created, location: @paiement }
        else
          format.html { render :new }
          format.json { render json: @paiement.errors, status: :unprocessable_entity }
        end
      end
    end
  end

# PATCH/PUT /paiements/1
# PATCH/PUT /paiements/1.json
def update
  respond_to do |format|
    if @paiement.update(paiement_params)
      format.html { redirect_to @paiement, notice: 'Paiement was successfully updated.' }
      format.json { render :show, status: :ok, location: @paiement }
    else
      format.html { render :edit }
      format.json { render json: @paiement.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /paiements/1
# DELETE /paiements/1.json
def destroy
  @paiement.destroy
  respond_to do |format|
    format.html { redirect_to paiements_url, notice: 'Paiement was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_paiement
    @paiement = Paiement.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def paiement_params
    params.require(:paiement).permit(:boutique_id, :client_id, :vente_id, :achat_id, :fournisseur_id, :datepaiement, :motif, :montant)
  end
end
