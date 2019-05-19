class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :components]

  def home
  end

  def components
    @shirts = Shirt.all
    @fabrics = ['fabric-1.png', 'fabric-2.png', 'fabric-3.png', 'fabric-4.png', 'fabric-5.png', 'fabric-6.png', 'fabric-7.png', 'fabric-8.png', 'fabric-9.png', 'fabric-10.png',]
    @num = 1
  end
end
