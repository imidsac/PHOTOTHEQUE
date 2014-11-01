class PrestationAttachmentsController < ApplicationController
  before_action :set_prestation_attachment, only: [:show, :edit, :update, :destroy]

  # GET /prestation_attachments
  # GET /prestation_attachments.json
  def index
    @prestation_attachments = PrestationAttachment.all

  end

  # GET /prestation_attachments/1
  # GET /prestation_attachments/1.json
  def show
  end

  # GET /prestation_attachments/new
  def new
    @prestation_attachment = PrestationAttachment.new
    #@prestation_attachment = @prestation_attachments.new
  end

  # GET /prestation_attachments/1/edit
  def edit
  end

  # POST /prestation_attachments
  # POST /prestation_attachments.json
  def create
    #@prestation_attachment = PrestationAttachment.new(prestation_attachment_params)

    params[:prestation_attachment]['photo'].each do |a|
          @prestation_attachment = PrestationAttachment.create!(:photo => a)
    end

    respond_to do |format|
      if @prestation_attachment.save
        format.html { redirect_to prestation_attachments_url, notice: 'Prestation attachment was successfully created.' }
        format.json { render :show, status: :created, location: @prestation_attachment }
      else
        format.html { render :new }
        format.json { render json: @prestation_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prestation_attachments/1
  # PATCH/PUT /prestation_attachments/1.json
  def update
    respond_to do |format|
      if @prestation_attachment.update(prestation_attachment_params)
        format.html { redirect_to @prestation_attachment, notice: 'Prestation attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @prestation_attachment }
      else
        format.html { render :edit }
        format.json { render json: @prestation_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prestation_attachments/1
  # DELETE /prestation_attachments/1.json
  def destroy
    @prestation_attachment.destroy
    respond_to do |format|
      format.html { redirect_to prestation_attachments_url, notice: 'Prestation attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prestation_attachment
      @prestation_attachment = PrestationAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prestation_attachment_params
      params.require(:prestation_attachment).permit(:photo)
    end
end
