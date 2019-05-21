class ShirtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:category] == "long"
      @shirts = Shirt.where(collar: "long")
    elsif params[:category] == "short"
      @shirts = Shirt.where(collar: "short")
    elsif params[:category] == "none"
      @shirts = Shirt.where(pocket: "none")
    elsif params[:category] == "one"
      @shirts = Shirt.where(pocket: "one")
    elsif params[:category] == "two"
      @shirts = Shirt.where(pocket: "two")
    elsif params[:category] == "no"
      @shirts = Shirt.where(placket: "no")
    elsif params[:category] == "yes"
      @shirts = Shirt.where(placket: "yes")
    elsif params[:category] == "all"
      @shirts = Shirt.all
    else
      @shirts =  Shirt.all
    end
    @fabrics = ['fabric-1.png', 'fabric-2.png', 'fabric-3.png', 'fabric-4.png', 'fabric-5.png', 'fabric-6.png', 'fabric-7.png', 'fabric-8.png', 'fabric-9.png', 'fabric-10.png',]
    @num = 1
  end

  def show
    @shirt = Shirt.find(params[:id])
    @fabrics = ['fabric-1.png', 'fabric-2.png', 'fabric-3.png', 'fabric-4.png', 'fabric-5.png', 'fabric-6.png', 'fabric-7.png', 'fabric-8.png', 'fabric-9.png', 'fabric-10.png',]
  end
end
