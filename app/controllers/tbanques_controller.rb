class TbanquesController < ApplicationController
  before_action :set_tbanque, only: [:show, :edit, :update, :destroy]

  # GET /tbanques
  # GET /tbanques.json
  def index
    @tbanques = Tbanque.all
  end

  # GET /tbanques/1
  # GET /tbanques/1.json
  def show
  end

  # GET /tbanques/new
  def new
    @tbanque = Tbanque.new
  end

  # GET /tbanques/1/edit
  def edit
  end

  # POST /tbanques
  # POST /tbanques.json
  def create
    @tbanque = Tbanque.new(tbanque_params)

    respond_to do |format|
      if @tbanque.save
        format.html { redirect_to @tbanque, notice: 'Tbanque was successfully created.' }
        format.json { render :show, status: :created, location: @tbanque }
      else
        format.html { render :new }
        format.json { render json: @tbanque.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tbanques/1
  # PATCH/PUT /tbanques/1.json
  def update
    respond_to do |format|
      if @tbanque.update(tbanque_params)
        format.html { redirect_to @tbanque, notice: 'Tbanque was successfully updated.' }
        format.json { render :show, status: :ok, location: @tbanque }
      else
        format.html { render :edit }
        format.json { render json: @tbanque.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbanques/1
  # DELETE /tbanques/1.json
  def destroy
    @tbanque.destroy
    respond_to do |format|
      format.html { redirect_to tbanques_url, notice: 'Tbanque was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbanque
      @tbanque = Tbanque.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbanque_params
      params.require(:tbanque).permit(:banque_id, :type_rv, :montant, :porteur)
    end
end
