class TcaissesController < ApplicationController
  before_action :set_tcaiss, only: [:show, :edit, :update, :destroy]

  # GET /tcaisses
  # GET /tcaisses.json
  def index
    @tcaisses = Tcaisse.all
  end

  # GET /tcaisses/1
  # GET /tcaisses/1.json
  def show
  end

  # GET /tcaisses/new
  def new
    @tcaiss = Tcaisse.new
  end

  # GET /tcaisses/1/edit
  def edit
  end

  # POST /tcaisses
  # POST /tcaisses.json
  def create
    @tcaiss = Tcaisse.new(tcaiss_params)

    respond_to do |format|
      if @tcaiss.save
        format.html { redirect_to @tcaiss, notice: 'Tcaisse was successfully created.' }
        format.json { render :show, status: :created, location: @tcaiss }
      else
        format.html { render :new }
        format.json { render json: @tcaiss.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tcaisses/1
  # PATCH/PUT /tcaisses/1.json
  def update
    respond_to do |format|
      if @tcaiss.update(tcaiss_params)
        format.html { redirect_to @tcaiss, notice: 'Tcaisse was successfully updated.' }
        format.json { render :show, status: :ok, location: @tcaiss }
      else
        format.html { render :edit }
        format.json { render json: @tcaiss.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tcaisses/1
  # DELETE /tcaisses/1.json
  def destroy
    @tcaiss.destroy
    respond_to do |format|
      format.html { redirect_to tcaisses_url, notice: 'Tcaisse was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tcaiss
      @tcaiss = Tcaisse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tcaiss_params
      params.require(:tcaiss).permit(:date_tc, :crencier, :type)
    end
end
