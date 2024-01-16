class Api::LogosController < ApiController
  skip_before_action :authenticate, only: [:security]

  def search
    kind = params[:kind] || "security"
    query = params[:q] || ""
  end

  def security
    symbol = params[:symbol]
    security = Security.find_by("lower(symbol) = ?", symbol.downcase)

    unless security
      render json: { error: 'Not Found' }, status: :not_found
    end
  end
end
