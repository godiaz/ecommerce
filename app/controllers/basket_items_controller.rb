class BasketItemsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    basket = find_basket
    shirt = Shirt.find(params[:shirt_id])
    item = BasketItem.new(basket: basket, shirt: shirt, price: shirt.price)
    if item.save
      flash[:notice] = "#{shirt.name} added to basket"
      redirect_to shirts_path
    else
      redirect_back(fallback_location: shirt_path(shirt))
    end
  end

  def destroy
    @basket_item = BasketItem.find(params[:id])
    @basket_item.destroy
    redirect_to basket_path
  end
end
