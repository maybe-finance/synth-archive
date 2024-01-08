class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  
  def index
    redirect_to dashboard_path# if user_signed_in?
  end
  
  def dashboard
  end
end
