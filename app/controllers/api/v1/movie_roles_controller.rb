class Api::V1::MovieRolesController < ApplicationController
  def create
    @member = MovieRole.new(member_params)
    @member.movie =  Movie.find(params[:movie_id])
    if @member.save
      render :json => @member, :status => 201
    else
      render json:{ "message": @member.errors.messages }, :status => 422
    end
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @movie_role = @movie.movie_roles.find(params[:id])
    if @movie_role.delete
      render :status => 204
    end
  end

  private

  def member_params
    params.require(:member).permit(:role_name,:person_id)
  end
end
