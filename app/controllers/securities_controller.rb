class SecuritiesController < ApplicationController
  before_action :set_security, only: %i[ show edit update destroy ]

  # GET /securities or /securities.json
  def index
    @securities = Security.limit(10).order(:name)
  end

  # GET /securities/1 or /securities/1.json
  def show
  end
  
  # GET /securities/1/edit
  def edit
  end

  # POST /securities or /securities.json
  def create
    @security = Security.new(security_params)

    respond_to do |format|
      if @security.save
        format.html { redirect_to security_url(@security), notice: "Security was successfully created." }
        format.json { render :show, status: :created, location: @security }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @security.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /securities/1 or /securities/1.json
  def update
    respond_to do |format|
      if @security.update(security_params)
        format.html { redirect_to security_url(@security), notice: "Security was successfully updated." }
        format.json { render :show, status: :ok, location: @security }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @security.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /securities/1 or /securities/1.json
  def destroy
    @security.destroy!

    respond_to do |format|
      format.html { redirect_to securities_url, notice: "Security was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_security
      @security = Security.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def security_params
      params.require(:security).permit(:logos, :exchange_id, :name, :symbol, :legal_name, :links, :color, :description)
    end
end
