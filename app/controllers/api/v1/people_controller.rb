class Api::V1::PeopleController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show,:index]

  def index
    render json: Person.all.as_json
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      render :json => @person, :status => 201
    else
      render json:{ "message": @person.errors.messages }, :status => 422
    end
  end

  def show
    render json: Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(person_params)
      render :json => @person, :status => 200
    else
      render json:{ "message": @person.errors.messages }, :status => 422
    end
  end

  def destroy
    @person = Person.find(params[:id])
    if @person.delete
      render :status => 204
    end
  end

  private

  def person_params
    params.require(:person).permit(:first_name,:last_name,:aliases)
  end
end
