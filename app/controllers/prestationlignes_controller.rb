class PrestationlignesController < ApplicationController
  load_and_authorize_resource
  before_filter :get_prestation
  before_action :set_prestationligne, only: [:show, :edit, :update, :destroy]

  # GET /prestationlignes
  # GET /prestationlignes.json
  def index
    @prestationlignes = Prestationligne.all
  end

  # GET /prestationlignes/1
  # GET /prestationlignes/1.json
  def show
  end

  # GET /prestationlignes/new
  def new
    @prestationligne = Prestationligne.new
  end

  # GET /prestationlignes/1/edit
  def edit
  end

  # POST /prestationlignes
  # POST /prestationlignes.json
  def create
    @prestationligne = @prestation.prestationlignes.new(prestationligne_params)

    respond_to do |format|
      if @prestationligne.save
        format.html { redirect_to @prestationligne.prestation }
        format.json { render :show, status: :created, location: @prestationligne }
      else
        format.html { render :new }
        format.json { render json: @prestationligne.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prestationlignes/1
  # PATCH/PUT /prestationlignes/1.json
  def update

    respond_to do |format|
      if @prestationligne.update(prestationligne_params)
        format.html { redirect_to @prestationligne.prestation, notice: 'Prestationligne was successfully updated.' }
        format.json { render :show, status: :ok, location: @prestationligne }
      else
        format.html { render :edit }
        format.json { render json: @prestationligne.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prestationlignes/1
  # DELETE /prestationlignes/1.json
  def destroy
    @prestationligne.destroy
    respond_to do |format|
      format.html { redirect_to @prestationligne.prestation, notice: 'Prestationligne was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit_multiple
    if params[:prestationligne_ids].present?
      @prestationlignes2 = Prestationligne.find(params[:prestationligne_ids])
    else
      redirect_to @prestation,  notice: 'veillez selectionnez les produit.'
    end

  end

  def update_multiple
    @prestationlignes3 = Prestationligne.update(params[:prestationlignes].keys, params[:prestationlignes].values)
    if @prestationlignes3.reject! { |p| p.errors.empty? }
      redirect_to @prestation, notice: 'gggggggg.'
    else
      render "edit_multiple"
    end
  end

  def livret
    @prestationligne.update(qtelivre: @prestationligne.qte)
    redirect_to @prestation, notice: 'Produit est totalement livret.'
  end

  def nlivret
    @prestationligne.update(:qtelivre => 0)
    redirect_to @prestation, notice: 'Livraison Annuler.'
  end

  def livrets
    @df = Prestationligne.where("prestation_id = ?", @prestation.id)
    @df.each {|x| x.update(:qtelivre => x.qte)}
    redirect_to @prestation, notice: 'Commande est totalement livret.'
  end

  def nlivrets
    @df = Prestationligne.where("prestation_id = ?", @prestation.id)
    @df.each {|x| x.update(:qtelivre => 0)}
    redirect_to @prestation, notice: 'Commande est no livret.'
  end

  private
  def get_prestation
    @prestation = Prestation.find(params[:prestation_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_prestationligne
      @prestationligne = Prestationligne.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prestationligne_params
      params.require(:prestationligne).permit(:formatphoto_id, :cadre_id, :qte, :qtelivre, :prix_u, :numero_prise, :type_pl, :color)
    end
  end
