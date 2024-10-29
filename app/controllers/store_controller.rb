class StoreController < ApplicationController
  skip_before_action :authorize
include CurrentCart
before_action :set_cart
  # GET /store
  def index

    @products = Product.order(:title)
   
  end
end
