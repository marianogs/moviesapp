class Api::V1::MoviesController < ApplicationController
  def index
    render json: Movie.all.as_json
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      render :json => @movie, :status => 201
    else
      render json:{ "message": @movie.errors.messages }, :status => 422
    end
  end

  def show
    render json: Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(movie_params)
      render :json => @movie, :status => 200
    else
      render json:{ "message": @movie.errors.messages }, :status => 422
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    if @movie.delete
      render :status => 204
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title,:release_year)
  end
end
