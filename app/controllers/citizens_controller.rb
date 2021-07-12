class CitizensController < ApplicationController
  def index
    @citizens = Citizen.all.order(:id)
  end

  def new
    @citizen = Citizen.new
  end

  def create
    # @citizen = Object.new(params[:citizen])
    # if @citizen.save
    #   flash[:success] = "Object successfully created"
    #   redirect_to @citizen
    # else
    #   flash[:error] = "Something went wrong"
    #   render 'new'
    # end
  end
  
end