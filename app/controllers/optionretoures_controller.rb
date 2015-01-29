class OptionretouresController < ApplicationController
  before_action :set_optionretoure, only: [:show, :edit, :update, :destroy]

  # GET /optionretoures
  # GET /optionretoures.json
  def index
    @optionretoures = Optionretoure.all
  end

  # GET /optionretoures/1
  # GET /optionretoures/1.json
  def show
  end

  # GET /optionretoures/new
  def new
    @optionretoure = Optionretoure.new
  end

  # GET /optionretoures/1/edit
  def edit
  end

  # POST /optionretoures
  # POST /optionretoures.json
  def create
    @optionretoure = Optionretoure.new(optionretoure_params)

    respond_to do |format|
      if @optionretoure.save
        format.html { redirect_to @optionretoure, notice: 'Optionretoure was successfully created.' }
        format.json { render :show, status: :created, location: @optionretoure }
      else
        format.html { render :new }
        format.json { render json: @optionretoure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /optionretoures/1
  # PATCH/PUT /optionretoures/1.json
  def update
    respond_to do |format|
      if @optionretoure.update(optionretoure_params)
        format.html { redirect_to @optionretoure, notice: 'Optionretoure was successfully updated.' }
        format.json { render :show, status: :ok, location: @optionretoure }
      else
        format.html { render :edit }
        format.json { render json: @optionretoure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /optionretoures/1
  # DELETE /optionretoures/1.json
  def destroy
    @optionretoure.destroy
    respond_to do |format|
      format.html { redirect_to optionretoures_url, notice: 'Optionretoure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_optionretoure
      @optionretoure = Optionretoure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def optionretoure_params
      params.require(:optionretoure).permit(:name, :description, :user_id)
    end
end
