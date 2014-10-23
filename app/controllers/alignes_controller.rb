class AlignesController < ApplicationController
  before_action :set_aligne, only: [:show, :edit, :update, :destroy]

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
    @aligne = Aligne.new(aligne_params)

    respond_to do |format|
      if @aligne.save
        format.html { redirect_to @aligne, notice: 'Aligne was successfully created.' }
        format.json { render :show, status: :created, location: @aligne }
      else
        format.html { render :new }
        format.json { render json: @aligne.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alignes/1
  # PATCH/PUT /alignes/1.json
  def update
    respond_to do |format|
      if @aligne.update(aligne_params)
        format.html { redirect_to @aligne, notice: 'Aligne was successfully updated.' }
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
      format.html { redirect_to alignes_url, notice: 'Aligne was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aligne
      @aligne = Aligne.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aligne_params
      params.require(:aligne).permit(:achat_id, :qte, :qtelivre, :montant, :etat)
    end
end
