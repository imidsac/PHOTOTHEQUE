class AlignesController < ApplicationController
  load_and_authorize_resource
  before_filter :get_achat
  before_action :set_aligne, only: [:show, :edit, :update, :destroy, :livret, :nlivret]

  # GET /alignes
  # GET /alignes.json
  def index
    @alignes = Aligne.all
  end

  # GET /alignes/1
  # GET /alignes/1.json
  def show
  end

  # GET /alignes/new
  def new
    @aligne = Aligne.new
  end

  # GET /alignes/1/edit
  def edit
  end

  # POST /alignes
  # POST /alignes.json
  def create
    @aligne = @achat.alignes.new(aligne_params)

    respond_to do |format|
      if @aligne.save
        format.html { redirect_to @aligne.achat}
        format.json { render :show, status: :created, location: @aligne }
      else
        format.html { redirect_to @aligne.achat }
        format.json { render json: @aligne.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alignes/1
  # PATCH/PUT /alignes/1.json
  def update
    #@aligne = @achat.alignes.find(params[:id])
    respond_to do |format|
      if @aligne.update(aligne_params)
        format.html { redirect_to @aligne.achat, notice: 'Aligne was successfully updated.' }
        format.json { render :show, status: :ok, location: @aligne }
      else
        format.html { render :edit }
        format.json { render json: @aligne.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alignes/1
  # DELETE /alignes/1.json
  def destroy
    @aligne.destroy
    respond_to do |format|
      format.html { redirect_to @aligne.achat, notice: 'Aligne was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit_multiple
    if params[:aligne_ids].present?
      @alignes2 = Aligne.find(params[:aligne_ids])
    else
      redirect_to @achat,  notice: 'veillez selectionnez les produit.'
    end

  end

  def update_multiple
    @alignes3 = Aligne.update(params[:alignes].keys, params[:alignes].values)
    if @alignes3.reject! { |p| p.errors.empty? }
      redirect_to @achat, notice: 'gggggggg.'
    else
      render "edit_multiple"
    end
  end

  def livret
    #@aligne.update(etat: 'n')
    @aligne.update(qtelivre: @aligne.qte)
    redirect_to @achat, notice: 'Commande est totalement livret.'
  end

  def nlivret
    #@aligne.update(etat: 'n')
    @aligne.update(:qtelivre => 0)
    redirect_to @achat, notice: 'Livraison Annuler.'
  end


  def livret_achats
    @df = Aligne.where("achat_id = ?", @achat.id)
    @df.each {|x| x.update(:qtelivre => x.qte)}
    redirect_to @achat, notice: 'Commande est totalement livret.'
  end

  def nlivret_achats
    @df = Aligne.where("achat_id = ?", @achat.id)
    #@df.update_all(:etat => 'n', :id =>)
    @df.each {|x| x.update(:qtelivre => 0)}
    redirect_to @achat, notice: 'Commande est no livret.'
  end

  private

  def get_achat
    @achat = Achat.find(params[:achat_id])
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_aligne
      @aligne = Aligne.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aligne_params
      params.require(:aligne).permit(:achat_id, :article_id, :cadre_id, :qte, :qtelivre, :prix_u, :remise, :user_id)
    end
end
