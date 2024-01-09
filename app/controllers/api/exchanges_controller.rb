class Api::ExchangesController < ApiController
  def index
    exchanges = Exchange.order(:name)
    @pagy, @exchanges = pagy(exchanges, items: 2)
    @pagy_metadata = pagy_metadata(@pagy)

    api_user.charge_credits(1, nil, "Exchange index")
  end

  def show
    @exchange = Exchange.find_by("lower(acronym) = ? OR lower(mic_code) = ?", params[:id].downcase, params[:id].downcase)

    api_user.charge_credits(1, @exchange)

    raise ActiveRecord::RecordNotFound if @exchange.nil?
  end
end
