class ApiController < ApplicationController
  include Pagy::Backend
  include ApiAuthentication
  skip_before_action :verify_authenticity_token
  before_action :set_default_response_format
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def set_default_response_format
    request.format = :json
  end

  def record_not_found
    render json: { error: 'Record not found' }, status: :not_found
  end
end