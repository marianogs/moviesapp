class Api::V1::UserTokensController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]
  def create
    @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if @user
      render json: @user.build_api_token!, status: :created
    else
      head :forbidden
    end
  end
end
