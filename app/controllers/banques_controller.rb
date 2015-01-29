class BanquesController < ApplicationController
  load_and_authorize_resource
  before_action :set_banque, only: [:show, :edit, :update, :destroy]

  # GET /banques
  # GET /banques.json
  def index
    @banques = Banque.where("id != ?", -1)
    @banques = Banque.caisse if params[:caisse]
    @tbanques = Tbanque.all

    @paiement = Paiement.new
  end

  # GET /banques/1
  # GET /banques/1.json
  def show
  end

  # GET /banques/new
  def new
    @banque = Banque.new
  end

  # GET /banques/1/edit
  def edit
  end

  # POST /banques
  # POST /banques.json
  def create
    @banque = Banque.new(banque_params)

    respond_to do |format|
      if @banque.save
        format.html { redirect_to @banque, notice: 'Banque was successfully created.' }
        format.json { render :show, status: :created, location: @banque }
      else
        format.html { render :new }
        format.json { render json: @banque.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /banques/1
  # PATCH/PUT /banques/1.json
  def update
    respond_to do |format|
      if @banque.update(banque_params)
        format.html { redirect_to @banque, notice: 'Banque was successfully updated.' }
        format.json { render :show, status: :ok, location: @banque }
      else
        format.html { render :edit }
        format.json { render json: @banque.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /banques/1
  # DELETE /banques/1.json
  def destroy
    @banque.destroy
    respond_to do |format|
      format.html { redirect_to banques_url, notice: 'Banque was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_banque
    @banque = Banque.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def banque_params
    params.require(:banque).permit(:nom, :compte, :solde)
  end
end
