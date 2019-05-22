class BasketsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @basket = find_basket
    @num = 1
  end
end
