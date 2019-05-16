class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  private

  def find_basket
    if current_user
      if current_user.basket && session[:basket_id]
        combine_baskets
      elsif current_user.basket
        current_user.basket
      elsif session[:basket_id]
        basket = Basket.find(session[:basket_id])
        session[:basket_id] = nil
        Basket.update(user: current_user)
      else
        Basket.create(user: current_user)
      end
    else
      if session[:basket_id] && Basket.find(session[:basket_id])
        Basket.find(session[:basket_id])
      else
        basket = Basket.create
        session[:basket_id] = basket.id
        basket
      end
    end
  end

  def combine_baskets
    old_basket = Basket.find(session[:basket_id])
    session[:basket_id] = nil
    new_basket = current_user.basket
    old_basket.basket_items.each do |item|
      item.update(basket: new_basket)
    end
    old_basket.destroy
    new_basket
  end
end
