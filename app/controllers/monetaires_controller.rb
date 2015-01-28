class MonetairesController < ApplicationController
  load_and_authorize_resource
  before_action :set_monetaire, only: [:show, :edit, :update, :destroy]

  # GET /monetaires
  # GET /monetaires.json
  def index
    @monetaires = Monetaire.monait
  end

  # GET /monetaires/1
  # GET /monetaires/1.json
  def show
  end

  # GET /monetaires/new
  def new
    @monetaire = Monetaire.new
  end

  # GET /monetaires/1/edit
  def edit
  end

  # POST /monetaires
  # POST /monetaires.json
  def create
    @monetaire = Monetaire.new(monetaire_params)

    respond_to do |format|
      if @monetaire.save
        format.html { redirect_to @monetaire, notice: 'Monetaire was successfully created.' }
        format.json { render :show, status: :created, location: @monetaire }
      else
        format.html { render :new }
        format.json { render json: @monetaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monetaires/1
  # PATCH/PUT /monetaires/1.json
  def update
    respond_to do |format|
      if @monetaire.update(monetaire_params)
        format.html { redirect_to @monetaire, notice: 'Monetaire was successfully updated.' }
        format.json { render :show, status: :ok, location: @monetaire }
      else
        format.html { render :edit }
        format.json { render json: @monetaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monetaires/1
  # DELETE /monetaires/1.json
  def destroy
    @monetaire.destroy
    respond_to do |format|
      format.html { redirect_to monetaires_url, notice: 'Monetaire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_monetaire
    @monetaire = Monetaire.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def monetaire_params
    params.require(:monetaire).permit(:money, :valeur)
  end
end
