class ApplicationController < ActionController::API
  before_action :authenticate_user!
  attr_accessor :current_user

  def authenticate_user!
    @current_user ||= User.find_by_api_token(request.headers["TOKEN"])
    if @current_user
      return true
    else
      head :unauthorized
    end
  end
end
