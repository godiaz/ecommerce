class ShirtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @shirts =  Shirt.all
  end

  def show
    @shirt = Shirt.find(params[:id])
  end
end
