class CategoriedepsController < ApplicationController
  before_action :set_categoriedep, only: [:show, :edit, :update, :destroy]

  # GET /categoriedeps
  # GET /categoriedeps.json
  def index
    @categoriedeps = Categoriedep.all
  end

  # GET /categoriedeps/1
  # GET /categoriedeps/1.json
  def show
  end

  # GET /categoriedeps/new
  def new
    @categoriedep = Categoriedep.new
  end

  # GET /categoriedeps/1/edit
  def edit
  end

  # POST /categoriedeps
  # POST /categoriedeps.json
  def create
    @categoriedep = Categoriedep.new(categoriedep_params)

    respond_to do |format|
      if @categoriedep.save
        format.html { redirect_to @categoriedep, notice: 'Categoriedep was successfully created.' }
        format.json { render :show, status: :created, location: @categoriedep }
      else
        format.html { render :new }
        format.json { render json: @categoriedep.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categoriedeps/1
  # PATCH/PUT /categoriedeps/1.json
  def update
    respond_to do |format|
      if @categoriedep.update(categoriedep_params)
        format.html { redirect_to @categoriedep, notice: 'Categoriedep was successfully updated.' }
        format.json { render :show, status: :ok, location: @categoriedep }
      else
        format.html { render :edit }
        format.json { render json: @categoriedep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categoriedeps/1
  # DELETE /categoriedeps/1.json
  def destroy
    @categoriedep.destroy
    respond_to do |format|
      format.html { redirect_to categoriedeps_url, notice: 'Categoriedep was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categoriedep
      @categoriedep = Categoriedep.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categoriedep_params
      params.require(:categoriedep).permit(:name, :description)
    end
end
