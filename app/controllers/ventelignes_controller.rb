class VentelignesController < ApplicationController
  load_and_authorize_resource
  before_filter :get_vente
  before_action :set_venteligne, only: [:show, :edit, :update, :destroy, :livret, :nlivret]

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
    @venteligne = @vente.ventelignes.new(venteligne_params)

    respond_to do |format|
      if @venteligne.save
        format.html { redirect_to @venteligne.vente}
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
      #@venteligne = Venteligne.find(params[:id])

    respond_to do |format|
      if @venteligne.update(venteligne_params)
        format.html { redirect_to @venteligne.vente, notice: 'Venteligne was successfully updated.' }
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
      format.html { redirect_to @venteligne.vente, notice: 'Venteligne was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit_multiple
    if params[:venteligne_ids].present?
      @ventelignes2 = Venteligne.find(params[:venteligne_ids])
    else
      redirect_to @vente,  notice: 'veillez selectionnez les produit.'
    end

  end

  def update_multiple
    @ventelignes3 = Venteligne.update(params[:ventelignes].keys, params[:ventelignes].values)
    if @ventelignes3.reject! { |p| p.errors.empty? }
      redirect_to @vente, notice: 'gggggggg.'
    else
      render "edit_multiple"
    end
  end

  def livret
    #@venteligne.update(etat: 'n')
    @venteligne.update(qtelivre: @venteligne.qte)
    redirect_to @vente, notice: 'Produit est totalement livret.'
  end

  def nlivret
    #@venteligne.update(etat: 'n')
    @venteligne.update(:qtelivre => 0)
    redirect_to @vente, notice: 'Livraison Annuler.'
  end

  def livrets
    @df = Venteligne.where("vente_id = ?", @vente.id)
    #@df.update_all(:etat => 'n', :id =>)
    @df.each {|x| x.update(:qtelivre => x.qte)}
    redirect_to @vente, notice: 'Commande est totalement livret.'
  end

  def nlivrets
    @df = Venteligne.where("vente_id = ?", @vente.id)
    #@df.update_all(:etat => 'n', :id =>)
    @df.each {|x| x.update(:qtelivre => 0)}
    redirect_to @vente, notice: 'Commande est no livret.'
  end

  private

  def get_vente
    @vente = Vente.find(params[:vente_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_venteligne
      @venteligne = Venteligne.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venteligne_params
      params.require(:venteligne).permit(:vente_id, :article_id, :cadre_id, :qte, :qtelivre, :prix_u, :montant)
    end
end
