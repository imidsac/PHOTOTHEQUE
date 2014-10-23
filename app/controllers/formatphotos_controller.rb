class FormatphotosController < ApplicationController
  before_action :set_formatphoto, only: [:show, :edit, :update, :destroy]

  # GET /formatphotos
  # GET /formatphotos.json
  def index
    @formatphotos = Formatphoto.all
  end

  # GET /formatphotos/1
  # GET /formatphotos/1.json
  def show
  end

  # GET /formatphotos/new
  def new
    @formatphoto = Formatphoto.new
  end

  # GET /formatphotos/1/edit
  def edit
  end

  # POST /formatphotos
  # POST /formatphotos.json
  def create
    @formatphoto = Formatphoto.new(formatphoto_params)

    respond_to do |format|
      if @formatphoto.save
        format.html { redirect_to @formatphoto, notice: 'Formatphoto was successfully created.' }
        format.json { render :show, status: :created, location: @formatphoto }
      else
        format.html { render :new }
        format.json { render json: @formatphoto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formatphotos/1
  # PATCH/PUT /formatphotos/1.json
  def update
    respond_to do |format|
      if @formatphoto.update(formatphoto_params)
        format.html { redirect_to @formatphoto, notice: 'Formatphoto was successfully updated.' }
        format.json { render :show, status: :ok, location: @formatphoto }
      else
        format.html { render :edit }
        format.json { render json: @formatphoto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formatphotos/1
  # DELETE /formatphotos/1.json
  def destroy
    @formatphoto.destroy
    respond_to do |format|
      format.html { redirect_to formatphotos_url, notice: 'Formatphoto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formatphoto
      @formatphoto = Formatphoto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formatphoto_params
      params.require(:formatphoto).permit(:dimention, :info)
    end
end
