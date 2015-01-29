class RetourelogsController < ApplicationController
  before_action :set_retourelog, only: [:show, :edit, :update, :destroy]

  # GET /retourelogs
  # GET /retourelogs.json
  def index
    @retourelogs = Retourelog.all
  end

  # GET /retourelogs/1
  # GET /retourelogs/1.json
  def show
  end

  # GET /retourelogs/new
  def new
    @retourelog = Retourelog.new
  end

  # GET /retourelogs/1/edit
  def edit
  end

  # POST /retourelogs
  # POST /retourelogs.json
  def create
    @retourelog = Retourelog.new(retourelog_params)

    respond_to do |format|
      if @retourelog.save
        format.html { redirect_to @retourelog, notice: 'Retourelog was successfully created.' }
        format.json { render :show, status: :created, location: @retourelog }
      else
        format.html { render :new }
        format.json { render json: @retourelog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /retourelogs/1
  # PATCH/PUT /retourelogs/1.json
  def update
    respond_to do |format|
      if @retourelog.update(retourelog_params)
        format.html { redirect_to @retourelog, notice: 'Retourelog was successfully updated.' }
        format.json { render :show, status: :ok, location: @retourelog }
      else
        format.html { render :edit }
        format.json { render json: @retourelog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /retourelogs/1
  # DELETE /retourelogs/1.json
  def destroy
    @retourelog.destroy
    respond_to do |format|
      format.html { redirect_to retourelogs_url, notice: 'Retourelog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_retourelog
      @retourelog = Retourelog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def retourelog_params
      params.require(:retourelog).permit(:date_re, :produit_id, :qte, :optionretoure_id, :achat_id, :vente_id, :motif, :user_id)
    end
end
