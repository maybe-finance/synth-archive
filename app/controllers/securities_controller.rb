class SecuritiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_security, only: %i[ show edit update destroy ]

  def index
    @securities = Security.limit(9).order(:name)
  end


  def show
  end
  
  def edit
  end

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

  def update
    @changeset = @security.changesets.new(proposed_changes: security_params, user: current_user)

    if @changeset.save
      redirect_to @security
    else
      render :edit
    end
  end

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
