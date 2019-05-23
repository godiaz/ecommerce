class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :date_of_birth, :phone, :occupation, :height, :weight, :shoe_size, :chest, :stomach, :arms, :seat, :thigh, :body_description, :preferred_fit, :dominant_hand, :jacket_size, :trouser_waist_size, :shirt_collar_size, :shirt_notes, :jacket_notes, :trouser_notes])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :date_of_birth, :phone, :occupation, :height, :weight, :shoe_size, :chest, :stomach, :arms, :seat, :thigh, :body_description, :preferred_fit, :dominant_hand, :jacket_size, :trouser_waist_size, :shirt_collar_size, :shirt_notes, :jacket_notes, :trouser_notes])
  end

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
